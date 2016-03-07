require 'rails_helper'

RSpec.describe Tweet, type: :model do

  describe "Tweet model testing" do

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
