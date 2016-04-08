class TweetCalculator

  def self.count_tweets
    state_tweets = Tweet.all.group_by(&:state_code)
    count = state_tweets.each do | key,  tweets|
      state_tweets[key] = tweets.group_by(&:hashtag_id)
    end
    count
  end

  def self.national_winner
    bernie = Tweet.where(hashtag_id: 1).count
    trump  = Tweet.where(hashtag_id: 2).count
    if bernie < trump
      "trump"
    else
      "bernie"
    end
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
      "trump - #{margin.round(1)}%"
    else
      margin = bernie/(bernie + trump).to_f * 100.0
      "bernie - #{margin.round(1)}%"
    end
  end

end
