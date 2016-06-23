class AddColumnToVotes < ActiveRecord::Migration
  def change
      add_reference :votes, :user, null:false
  end
end
