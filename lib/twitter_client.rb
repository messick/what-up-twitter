class TwitterClient

  def initialize(token, secret)
    @client = Twitter::Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: token,
      oauth_token_secret: secret
    )
  end

  def search_term term, user_id
    # grab list of ids statuses return by search, and cache
    response = Rails.cache.fetch(term, :expires_in => 5.minutes) do

      # need to update current search data disaplyed on Dashboard
      user = User.find(user_id)
      user.update_last_search_term term

      ids_from_search = @client.search(term, count: 20, lang: 'en').results.map(&:id)

      # now we have ids, iterate through and get oembed info for each tweet, and cache
      tweets = ids_from_search.map{|tweet_id| get_tweet_from_id tweet_id }

      {
        tweets: tweets,
        searchTime: Time.now.utc.to_s(:rfc822)
      }
    end

    response
  end

  def search_user username
    # grab list of ids statuses return by search, and cache
    response = Rails.cache.fetch(username, :expires_in => 5.minutes) do
      ids_from_search = @client.user_timeline(username, count: 20, lang: 'en').map(&:id)
      tweets = ids_from_search.map{|tweet_id| get_tweet_from_id tweet_id }

      {
        tweets: tweets,
        searchTime: Time.now.utc.to_s(:rfc822)
      }
    end

    response
  end

  def get_tweet_from_id id
    Rails.cache.fetch(id, :expires_in => 5.minutes) do
      @client.oembed(id)
    end
  end

end
