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
