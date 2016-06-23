class AddViewsColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :visits, :integer, null:false, default:0
  end
end
