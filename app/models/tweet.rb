class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  validates :tweet_id, uniqueness: true
  validates :location, presence: true
  validates :hashtag_id, presence: true
  validates :handle, presence: true
  validates :message, presence: true

  def self.create_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)

    t.hashtag_id = 1
    t.location   = tweet.user.location
    t.handle     = tweet.user.screen_name
    t.message    = tweet.text
    t.save
  end

  def standardize_location
    tweets = Tweet.all
    locations = tweets.map do |tweet|
      tweet.location
    end
    states = locations.map do |location|
      Geocoder.search(location).first.state_code unless
        Geocoder.search(location).first.nil?
    end
    states
  end

end
