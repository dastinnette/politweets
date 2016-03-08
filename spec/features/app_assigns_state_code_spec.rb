require 'rails_helper'

RSpec.feature "app properly assigns state code", type: :request do

  before do
    create_hashtags
    create_tweets
  end

  it "properly assigns state code to tweet" do
    VCR.use_cassette("state_code") do
      tweet = Tweet.find_by(tweet_id: "999999999999999999")
      Tweet.assign_state_code_to_tweet

      expect(tweet.state).to eq(nil)
    end
  end

  it "properly searches for user location" do
    VCR.use_cassette("standard_location") do
      tweet = Tweet.find_by(tweet_id: "888888888888888888")
      output = Tweet.standardize_location(tweet)

      expect(output).to eq("TX")
    end
  end

end
