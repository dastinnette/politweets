class AddHashtagRefToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :hashtag, index: true, foreign_key: true
  end
end
