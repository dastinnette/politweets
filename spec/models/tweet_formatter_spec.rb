require 'rails_helper'

RSpec.describe TweetFormatter, type: :model do

  describe "Tweet formatter model" do
    it "properly assigns state ids to tweets" do
      create_state
      create_hashtags
      tweet = Tweet.create(tweet_id: "999999999999999999",
                        location: "Birmingham",
                        hashtag_id: 1,
                        message: "Trump listens to Nickleback #FeelTheBern",
                        handle: "Bernie4prez",
                        state_code: "AL")
      TweetFormatter.assign_state_id_to_tweet
      tweet.reload

      expect(tweet.state_id).to eq(3)
    end

    it "destroys a tweet with no state id" do
      create_state
      create_hashtags
      create_tweets

      TweetFormatter.assign_state_code_to_tweet

      expect(Tweet.count).to eq(5)
    end
  end

end
