class TweetsController < ApplicationController

  def index
    @twitter = TwitterService.new(current_user)
  end

end
