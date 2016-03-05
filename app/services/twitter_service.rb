class TwitterService
  attr_reader :client

  def initialize
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def search_tweets(hashtag, index)
    tweets = client.search("to:#{hashtag}", result_type: "recent") 
    filtered_tweets = tweets.select do |tweet|
      !tweet.user.location.is_a?(Twitter::NullObject)
    end
    filtered_tweets.each { |tweet| Tweet.create_from_search(tweet, index) }
  end

end
