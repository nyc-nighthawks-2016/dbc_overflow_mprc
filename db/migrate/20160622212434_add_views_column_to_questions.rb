class AddViewsColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :visits, :integer, default:0, null:false
  end
end
