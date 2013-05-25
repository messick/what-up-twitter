class TwitterClient

  attr_accessor :client

  def initialize(token, secret)
    })
    @client = Twitter::Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: token,
      oauth_token_secret: secret
    )
  end

  def search_tweets term
    Rails.cache.fetch(term, :expires_in => 5.minute) do
      @client.search.tweets.json? q: term, count: 20, lang: 'en'
    end
  end
end
