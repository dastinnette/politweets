class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  
  def self.create_from_search(tweet)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)
    t.location = tweet.user.location
    t.save
  end

end
