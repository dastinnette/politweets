require 'rails_helper'

RSpec.describe "Twitter API", type: :request do
  attr_reader :service

  before do
    @service = TwitterService.new(user)
  end

  it "returns a list of tweets containing #feelthebern" do
    VCR.use_cassette("bernie_tweets") do

      tweets      = service.search_tweets("#feelthebern", 1)
      first_tweet = tweets.first

      expect(tweets.count).to eq(529)
      expect(first_tweet.user.screen_name).to eq("BankersforBerni")
      expect(first_tweet.user.location).to eq("asdf")
      expect(first_tweet.text).to have_content("#feelthebern")
    end
  end

  it "returns a list of tweets containing #makeamericagreatagain}" do
    VCR.use_cassette("bernie_tweets") do

      tweets      = service.search_tweets("#makeamericagreatagain}", 2)
      first_tweet = tweets.last

      expect(tweets.count).to eq(529)
      expect(first_tweet.user.screen_name).to eq("BankersforBerni")
      expect(first_tweet.user.location).to eq("asdf")
      expect(first_tweet.text).to have_content("#makeamericagreatagain}")
    end
  end

end
