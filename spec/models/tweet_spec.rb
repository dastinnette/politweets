require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe "Tweet model testing" do

    it "properly counts bernie tweets by state" do
      create_hashtags
      create_tweets_with_states

      output = Tweet.bernie_by_state("IL")

      expect(output).to eq(1)
    end

    it "properly counts trump tweets by state" do
      create_hashtags
      create_tweets_with_states

      output = Tweet.trump_by_state("IL")

      expect(output).to eq(2)
    end

    it "properly calculates a trump winner" do
      create_hashtags
      create_tweets_with_states

      output = Tweet.winning_margin("IL")

      expect(output).to eq("Trump - 66.7%")
    end

    it "properly calculates a bernie winner" do
      create_hashtags
      create_tweets_with_states2

      output = Tweet.winning_margin("IL")

      expect(output).to eq("Bernie - 66.7%")
    end

    it "properly assigns state ids to tweets" do
      create_state
      create_hashtags
      create_tweets

      tweet = Tweet.find_by(tweet_id: "999999999999999999")
      Tweet.assign_state_id_to_tweet

      expect(tweet.state_id).to eq(1)
    end

    it "is invalid without a handle" do
      tweet = Tweet.new(tweet_id: 22,
                        location: "Dallas",
                        message: "Yeehaw America!!! #Trump2016",
                        hashtag_id: 2)
      expect(tweet).to be_invalid
    end

    it "is invalid without a location" do
      tweet = Tweet.new(tweet_id: 22,
                        handle: "BuildThatWall",
                        message: "Yeehaw America!!! #Trump2016",
                        hashtag_id: 2)
      expect(tweet).to be_invalid
    end

    it "is invalid without a message" do
      tweet = Tweet.new(tweet_id: 22,
                        location: "Dallas",
                        handle: "BuildThatWall",
                        hashtag_id: 2)
      expect(tweet).to be_invalid
    end

    it "is invalid without a hashtag_id" do
      tweet = Tweet.new(tweet_id: 22,
                        handle: "BuildThatWall",
                        location: "Dallas",
                        message: "Yeehaw America!!! #Trump2016")
      expect(tweet).to be_invalid
    end
  end

end
