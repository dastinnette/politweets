class StandardizeTweets

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
      state = State.state_hash[tweet.state_code]
      name = State.find_by(name: state).id

      tweet.update(state_id: name)
    end
  end

end
