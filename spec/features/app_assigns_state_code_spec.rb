require 'rails_helper'

RSpec.feature "app properly assigns state code", type: :request do

  before do
    create_hashtags
    create_tweets
  end

  it "properly assigns state code to tweet" do
    VCR.use_cassette("state_codes") do
      tweet = Tweet.find_by(tweet_id: "999999999999999999")
      StandardizeTweets.assign_state_code_to_tweet

      expect(tweet.state_code).to eq("AL")
    end
  end

  it "properly searches for user location" do
    VCR.use_cassette("standard_locations") do
      tweet = Tweet.find_by(tweet_id: "888888888888888888")
      output = StandardizeTweets.standardize_location(tweet)

      expect(output).to eq("CA")
    end
  end

end
