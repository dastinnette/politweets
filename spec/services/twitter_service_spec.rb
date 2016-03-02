require 'rails_helper'

RSpec.describe "Twitter API", type: :request do
  attr_reader :service

  before do
    @service = TwitterService.new(user)
  end

  it "returns a list of tweets containing #FeelTheBern" do
    VCR.use_cassette("bernie_tweets") do
      tweets      = service.bernie_tweets
      first_tweet = tweets.first

      expect(tweets.count).to eq(55)
      expect(first_tweet.screen_name).to eq("Billy Bob")
    end
  end

  it "sucessfully outputs a #FeelTheBerner's location" do
    VCR.use_cassette("bernie_tweets") do
      tweet = service.bernie_tweets.first

      expect(tweet.user.location).to eq("CO")
    end
  end
  
end
