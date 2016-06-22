class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :user, null:false
  end
end
