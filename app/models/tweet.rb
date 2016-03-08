class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  belongs_to :state

  validates :tweet_id, uniqueness: true
  validates :location, presence: true
  validates :hashtag_id, presence: true
  validates :handle, presence: true
  validates :message, presence: true

  def self.create_bernie_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)

    t.hashtag_id = 1
    t.location   = tweet.user.location
    t.handle     = tweet.user.screen_name
    t.message    = tweet.text
    t.save
  end

  def self.create_trump_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)

    t.hashtag_id = 2
    t.location   = tweet.user.location
    t.handle     = tweet.user.screen_name
    t.message    = tweet.text
    t.save
  end

  def self.assign_state_code_to_tweet
    tweets = Tweet.where(state_code: nil)
    tweets.each do |tweet|
      state = standardize_location(tweet)
      if state == nil
        tweet.destroy
      else
        tweet.update(state_code: state)
      end
    end
  end

  def self.standardize_location(tweet)
    location = tweet.location
    state = Geocoder.search(location).try(:first).try(:state)
    state_codes.include?(state) ? state : nil
  end

  def self.assign_state_id_to_tweet
    tweets = Tweet.where(state_id: nil)
    tweets.each do |tweet|
      state = State.where()
      tweet.update(state_id: state)
    end
  end

  def self.count_tweets
    state_tweets = Tweet.all.group_by(&:state)
    count = state_tweets.each do | key, value|
      state_tweets[key] = value.group_by(&:hashtag_id)
    end
    count
  end

  def self.bernie_by_state(state)
    if count_tweets[state][1].nil?
      0
    else
      count_tweets[state][1].count
    end
  end

  def self.trump_by_state(state)
    if count_tweets[state][2].nil?
      0
    else
      count_tweets[state][2].count
    end
  end

  def self.winning_margin(state)
    bernie = bernie_by_state(state)
    trump  = trump_by_state(state)
    if bernie < trump
      margin = trump/(bernie + trump).to_f * 100.0
      "Trump - #{margin.round(1)}%"
    else
      margin = bernie/(bernie + trump).to_f * 100.0
      "Bernie - #{margin.round(1)}%"
    end
  end

  private

  def self.state_codes
    ["AL",
     "AK",
     "AZ",
     "AR",
     "CA",
     "CO",
     "CT",
     "DC",
     "DE",
     "FL",
     "GA",
     "HI",
     "ID",
     "IL",
     "IN",
     "IA",
     "KS",
     "KY",
     "LA",
     "ME",
     "MD",
     "MA",
     "MI",
     "MN",
     "MS",
     "MO",
     "MT",
     "NE",
     "NV",
     "NH",
     "NJ",
     "NM",
     "NY",
     "NC",
     "ND",
     "OH",
     "OK",
     "OR",
     "PA",
     "RI",
     "SC",
     "SD",
     "TN",
     "TX",
     "UT",
     "VT",
     "VA",
     "WA",
     "WI",
     "WV",
     "WY"]
  end

end
