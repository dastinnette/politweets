class AddStateToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :state, :string
  end
end
