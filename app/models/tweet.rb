class Tweet < ActiveRecord::Base

  def self.find_or_create_from_search
    tweet = Tweet.find_or_create_by(:id)

    tweet.tweet_id = ???.id
    tweet.location = ???.user.location

    tweet.save
    tweet
  end

end
