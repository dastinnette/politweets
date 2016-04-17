class TweetFormatter

  def self.assign_state_code_to_tweet
    tweets = Tweet.where(state_code: nil)
    tweets.each do |tweet|
      state = standardize_location(tweet)
      if state == nil
        tweet.destroy
      elsif true
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
