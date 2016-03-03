class RemoveLocationFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :location, :string
  end
end
