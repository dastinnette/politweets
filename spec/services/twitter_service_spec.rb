require 'rails_helper'

RSpec.describe "Twitter API", type: :request do
  attr_reader :service

  before do
    @service = TwitterService.new(user)
  end

  it "returns a list of tweets containing hashtags" do
    hashtags = ["#feelthebern", "#makeamericagreatagain"]

    VCR.use_cassette("pull_tweets") do
      tweets      = service.search_tweets(hashtags, [0, 1])
      first_tweet = tweets.first
      last_tweet  = tweets.last

      expect(tweets.count).to eq(91)
      expect(first_tweet.user.screen_name).to eq("JerseyDan67")
      expect(first_tweet.user.location).to eq("Hamilton, NJ")
      expect(last_tweet.user.screen_name).to eq("JCPinCompton")
      expect(last_tweet.user.location).to eq("Compton, CA")
    end
  end

end
