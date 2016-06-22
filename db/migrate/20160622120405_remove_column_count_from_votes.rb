class RemoveColumnCountFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :count
  end
end
