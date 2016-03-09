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

      expect(tweets.count).to eq(763)
      expect(first_tweet.user.screen_name).to eq("Thebigsale85")
      expect(first_tweet.user.location).to eq("recalculating route. ")
    end
  end

  it "returns a list of tweets containing #makeamericagreatagain" do
    VCR.use_cassette("trump_tweets") do

      tweets      = service.search_trump_tweets("#makeamericagreatagain")
      first_tweet = tweets.first

      expect(tweets.count).to eq(796)
      expect(first_tweet.user.screen_name).to eq("jrjohns4")
      expect(first_tweet.user.location).to eq("Dunlap, IL")
    end
  end

end
