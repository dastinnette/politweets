class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  belongs_to :state
  validates :tweet_id, uniqueness: true
  validates :location, presence: true

  def self.create_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)
    t.state_id = tweet.user.location
    t.save
  end

end
