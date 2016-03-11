require "rails_helper"

RSpec.describe TweetCalculator, type: :model do

  describe "Tweet Calculator testing" do
    it "properly counts bernie tweets by state" do
      create_hashtags
      create_tweets_with_states

      output = TweetCalculator.bernie_by_state("IL")

      expect(output).to eq(1)
    end

    it "properly counts trump tweets by state" do
      create_hashtags
      create_tweets_with_states

      output = TweetCalculator.trump_by_state("IL")

      expect(output).to eq(2)
    end

    it "properly calculates a trump winner" do
      create_hashtags
      create_tweets_with_states

      output = TweetCalculator.winning_margin("IL")

      expect(output).to eq("Trump - 66.7%")
    end

    it "properly calculates a bernie winner" do
      create_hashtags
      create_tweets_with_states2

      output = TweetCalculator.winning_margin("IL")

      expect(output).to eq("Bernie - 66.7%")
    end
  end

end
