require "simplecov"
SimpleCov.start("rails")

  def user
    User.create(uid: ENV['TWITTER_UID'],
             name: 'David Stinnette',
             screen_name: 'dastinnette',
             oauth_token: ENV['TWITTER_TOKEN'],
             oauth_token_secret: ENV['TWITTER_TOKEN_SECRET'])
  end

  def create_state
    s1 = State.create(name: "Alabama", description: "Holy Santa Claus shit")
    s2 = State.create(name: "Illinois", description: "Pizza")
    s3 = State.create(name: "Wisconsin", description: "Cheese")
    s4 = State.create(name: "California", description: "Surf")
  end

  def create_hashtags
    h1 = Hashtag.create(id: 1, name: "#feelthebern")
    h2 = Hashtag.create(id: 2, name: "#makeamericagreatagain")
  end

  def create_tweets
    t1 = Tweet.create(tweet_id: "999999999999999999",
                      location: "Birmingham",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "Bernie4prez",
                      state_code: "AL")
    t2 = Tweet.create(tweet_id: "999999999999999998",
                      location: "Birmingham",
                      hashtag_id: 2,
                      message: "Trump listens to Nickleback #MakeAmericaGreatAgain",
                      handle: "Trump4prez",
                      state_code: "AL")
    t3 = Tweet.create(tweet_id: "888888888888888888",
                      location: "Los Angeles, CA",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThatWall",
                      state_code: "CA")
    t4 = Tweet.create(tweet_id: "888888888888888886",
                      location: "Los Angeles, CA",
                      hashtag_id: 1,
                      message: "Trump is a goon #feelthebern",
                      handle: "BuildNoWall",
                      state_code: "CA")
    t5 = Tweet.create(tweet_id: "888888888888888887",
                      location: "Earf",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildTheWall")
  end

  def create_tweets_with_states
    t1 = Tweet.create(tweet_id: "999999999999999999",
                      location: "Chicago",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "Bernie4prez",
                      state_code: "IL")
    t1 = Tweet.create(tweet_id: "999999999999999998",
                      location: "Indianapolis",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "BernieForPrez",
                      state_code: "IN")
    t2 = Tweet.create(tweet_id: "888888888888888888",
                      location: "Chicago",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThatWall",
                      state_code: "IL")
    t3 = Tweet.create(tweet_id: "777777777777777777",
                      location: "Chicago",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildTheWall",
                      state_code: "IL")
  end

  def create_tweets_with_states2
    t1 = Tweet.create(tweet_id: "999999999999999999",
                      location: "Chicago",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "Bernie4prez",
                      state_code: "IL")
    t2 = Tweet.create(tweet_id: "999999999999999998",
                      location: "Chicago",
                      hashtag_id: 1,
                      message: "Trump listens to Nickleback #FeelTheBern",
                      handle: "BernieForPrez",
                      state_code: "IL")
    t3 = Tweet.create(tweet_id: "888888888888888888",
                      location: "Madison",
                      hashtag_id: 1,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThatWall",
                      state_code: "WI")
    t4 = Tweet.create(tweet_id: "777777777777777777",
                      location: "Chicago",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildTheWall",
                      state_code: "IL")
    t5 = Tweet.create(tweet_id: "666666666666666666",
                      location: "Madison",
                      hashtag_id: 2,
                      message: "I fear diversity #makeamericagreatagain",
                      handle: "BuildThemWalls",
                      state_code: "WI")
  end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
