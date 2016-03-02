require 'rails_helper'

RSpec.describe "Twitter API", type: :request do
  attr_reader :service

  before do
    @service = TwitterService.new
  end

  it "returns a list of tweets containing #FeelTheBern" do
    VCR.use_cassette("bernie_tweets") do
      tweets      = service.bernie_tweets
      first_tweet = tweets.first

      expect(tweets.count).to eq(529)
      expect(first_tweet.user.screen_name).to eq("CA_Talesh")
    end
  end

  it "sucessfully outputs a #FeelTheBerner's location" do
    VCR.use_cassette("bernie_tweets") do
      tweet = service.bernie_tweets.first

      expect(tweet.user.location).to eq("Houston")
    end
  end

  it "returns a list of tweets containing #MakeAmericaGreatAgain" do
    VCR.use_cassette("trump_tweets") do
      tweets      = service.trump_tweets
      first_tweet = tweets.first

      expect(tweets.count).to eq(208)
      expect(first_tweet.user.screen_name).to eq("khcslip")
    end
  end

  it "sucessfully outputs a #Trumper's location" do
    VCR.use_cassette("trump_tweets") do
      tweet = service.trump_tweets.first

      expect(tweet.user.location).to eq("Providence, RI")
    end
  end

end
