require 'rails_helper'

RSpec.describe TweetMap, type: :model do

  describe "Tweet Map model" do
    it "properly renders tweet map" do
      create_state
      create_hashtags
      create_tweets_with_states2

      output = TweetMap.tweet_map

      expect(output).to eq([{:state=>"IL",
                             :winner=>"Bernie",
                             :loser=>"Trump",
                             :loserCount=>1,
                             :winnerCount=>2,
                             :color=>"#303f9f",
                             :winnerPercentage=>66.7}, {
                               :state=>"WI",
                               :winner=>"Bernie",
                               :loser=>"Bernie",
                               :loserCount=>1,
                               :winnerCount=>1,
                               :color=>"#303f9f",
                               :winnerPercentage=>50.0
                             }])
    end
  end

end
