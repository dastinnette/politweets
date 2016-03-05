class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  validates :tweet_id, uniqueness: true
  validates :location, presence: true
  validates :hashtag_id, presence: true

  def self.create_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)

    t.hashtag_id = 1
    t.location   = tweet.user.location
    t.handle     = tweet.user.screen_name
    t.message    = tweet.text
    t.save
  end

end
