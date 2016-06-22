class RenameCategoriesTable < ActiveRecord::Migration
  def change
    rename_table :categories, :question_tags
  end
end
