class TweetMap

  def self.tweet_map
    colors = {"Bernie" => '#303f9f', "Trump" => '#b71c1c'}
    Tweet.all.group_by(&:state_code).map do |state, pile_o_tweets|
      by_hashtag = pile_o_tweets.group_by(&:hashtag_id)
      counts = {"Bernie" => by_hashtag[1].count,
                "Trump" => by_hashtag[2].count}
      winner = counts.max_by(&:last).first
      loser = counts.min_by(&:last).first
      total = (counts[loser] + counts[winner])
      {state: state,
        winner: winner,
        loser: loser,
        loserCount: counts[loser],
        winnerCount: counts[winner],
        color: colors[winner],
        winnerPercentage: ((counts[winner]/total.to_f) * 100).round(1)
      }
    end
  end

end
