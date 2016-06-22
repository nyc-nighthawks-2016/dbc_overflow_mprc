class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :description, :string, null:false
  end
end
