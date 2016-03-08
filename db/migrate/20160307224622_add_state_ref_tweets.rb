class AddStateRefTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :state, index: true, foreign_key: true
  end
end
