class TwitterService
  attr_reader :client

  def initialize(user)
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def bernie_tweets
    tweets = client.search("to:#feelthebern")
    filtered = tweets.select do |tweet|
      !tweet.user.location.is_a?(Twitter::NullObject)
    end
    filtered
  end

  def bernie_output
    bernie_tweets.map do |tweet|
      ["#{tweet.user.location}"]
    end
  end

  # def trump_tweets
  #   client.search("to:#makeamericagreatagain", result_type: "recent").take(500).collect do |tweet|
  #     "#{tweet.user.screen_name}: #{tweet.text}"
  #   end
  # end

end
