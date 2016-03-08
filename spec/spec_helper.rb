require "simplecov"
SimpleCov.start("rails")

  def user
    User.new(uid: ENV['TWITTER_UID'],
             name: 'David Stinnette',
             screen_name: 'dastinnette',
             oauth_token: ENV['TWITTER_TOKEN'],
             oauth_token_secret: ENV['TWITTER_TOKEN_SECRET'])
  end

  def create_hashtags
    h1 = Hashtag.create(id: 1, name: "#feelthebern")
    h2 = Hashtag.create(id: 2, name: "#makeamericagreatagain")
  end

  def create_tweets
    t1 = Tweet.create(tweet_id: "999999999999999999",
                      location: "Chicago",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "Bernie4prez")
    t2 = Tweet.create(tweet_id: "888888888888888888",
                      location: "El Paso",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThatWall")
  end

  def create_tweets_with_states
    t1 = Tweet.create(tweet_id: "999999999999999999",
                      location: "Chicago",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "Bernie4prez",
                      state: "IL")
    t2 = Tweet.create(tweet_id: "888888888888888888",
                      location: "Chicago",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThatWall",
                      state: "IL")
    t3 = Tweet.create(tweet_id: "777777777777777777",
                      location: "Chicago",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildTheWall",
                      state: "IL")
  end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
