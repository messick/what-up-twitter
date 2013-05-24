class TwitterClient

  attr_accessor :client

  def initialize(token, secret)
    @client = Grackle::Client.new(:auth=>{
      type: :oauth,
      consumer_key: ENV['TWITTER_CONSUMER_KEY'], consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      token: token, token_secret: secret
    })
  end

  def search_tweets term
    @client.search.tweets.json? q: term, count: 20, lang: 'en'
  end
end
