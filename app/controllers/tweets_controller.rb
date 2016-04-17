class TweetsController < ApplicationController

  def index
    @tweet_calculator = TweetCalculator.new
  end

end
