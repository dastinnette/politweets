require 'rails_helper'

RSpec.describe "Twitter API", type: :request do
  attr_reader :service

  before do
    @service = TwitterService.new(user)
    create_hashtags
  end

  it "returns a list of tweets containing #feelthebern" do
    VCR.use_cassette("bernie_tweets") do

      tweets      = service.search_bernie_tweets("#feelthebern")
      first_tweet = tweets.first

      expect(tweets.count).to eq(198)
      expect(first_tweet.user.screen_name).to eq("EnviroChem")
      expect(first_tweet.user.location).to eq("Saco Maine")
    end
  end

  it "returns a list of tweets containing #makeamericagreatagain" do
    VCR.use_cassette("trump_tweets") do

      tweets      = service.search_trump_tweets("#makeamericagreatagain")
      first_tweet = tweets.first

      expect(tweets.count).to eq(60)
      expect(first_tweet.user.screen_name).to eq("Helen571162721")
      expect(first_tweet.user.location).to eq("United States")
    end
  end

end
