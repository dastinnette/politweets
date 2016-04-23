class TweetCalculator
  attr_reader :tweet_count

  def initialize
    @tweet_count = count_tweets
  end

  def count_tweets
    state_tweets = Tweet.all.group_by(&:state_code)
    count = state_tweets.each do |state, tweets|
      state_tweets[state] = tweets.group_by(&:hashtag_id)
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

  def bernie_by_state(state)
    if tweet_count[state][1].nil?
      0
    else
      tweet_count[state][1].count
    end
  end

  def trump_by_state(state)
    if tweet_count[state][2].nil?
      0
    else
      tweet_count[state][2].count
    end
  end

  def winning_margin(state)
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
