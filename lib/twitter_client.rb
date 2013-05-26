class TwitterClient

  attr_accessor :client

  def initialize(token, secret)
    @client = Twitter::Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: token,
      oauth_token_secret: secret
    )
  end

  def search_tweets term
    # grab list of ids statuses return by search, and cache
    ids_from_search = Rails.cache.fetch(term, :expires_in => 5.minutes) do
      @client.search(term, count: 20, lang: 'en').results.map(&:id)
    end

    # now we have ids, iterate through and get oembed info for each tweet, and cache
    tweets = []
    tweets = ids_from_search.map{|tweet_id| get_tweet_from_id tweet_id }
  end

  def search_user username
    # grab list of ids statuses return by search, and cache
    ids_from_search = Rails.cache.fetch(username, :expires_in => 5.minutes) do
      @client.user_timeline(username, count: 20, lang: 'en').map(&:id)
    end

    # now we have ids, iterate through and get oembed info for each tweet, and cache
    tweets = []
    tweets = ids_from_search.map{|tweet_id| get_tweet_from_id tweet_id }
  end

  def get_tweet_from_id id
    Rails.cache.fetch(id, :expires_in => 5.minutes) do
      @client.oembed(id)
    end
  end

end
