class TwitterService
  attr_reader :client

  def initialize(current_user)
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  # Make more dynamic to allow for searches

  def search_tweets
    tweets = client.search("to:#feelthebern", result_type: "recent")
    filtered_tweets = tweets.select do |tweet|
      !tweet.user.location.is_a?(Twitter::NullObject)
    end
    filtered_tweets.each { |tweet| Tweet.create_from_search(tweet) }
  end

end
