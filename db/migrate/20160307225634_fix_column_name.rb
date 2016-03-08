class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :tweets, :state, :state_code
  end
end
