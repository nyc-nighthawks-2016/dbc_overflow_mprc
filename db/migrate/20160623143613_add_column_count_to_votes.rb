class AddColumnCountToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :count, :integer
  end
end
