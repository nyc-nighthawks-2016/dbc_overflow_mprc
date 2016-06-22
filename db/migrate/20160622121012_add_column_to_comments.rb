class AddColumnToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, null:false
  end
end
