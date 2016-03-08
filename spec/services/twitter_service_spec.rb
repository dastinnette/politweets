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

      expect(tweets.count).to eq(849)
      expect(first_tweet.user.screen_name).to eq("ineeshadvs")
      expect(first_tweet.user.location).to eq("Qatar | The Global Citizen")
    end
  end

  it "returns a list of tweets containing #makeamericagreatagain" do
    VCR.use_cassette("trump_tweets") do

      tweets      = service.search_trump_tweets("#makeamericagreatagain")
      first_tweet = tweets.first

      expect(tweets.count).to eq(655)
      expect(first_tweet.user.screen_name).to eq("sburton305")
      expect(first_tweet.user.location).to eq("Birmingham, AL")
    end
  end

end
