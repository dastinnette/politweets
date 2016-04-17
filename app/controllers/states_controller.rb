class StatesController < ApplicationController

  def index
    @states = State.all
    @tweet_calculator = TweetCalculator.new
  end

  def show
    @state = State.find(params[:id])
    @tweet_calculator = TweetCalculator.new
  end

end
