class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :tag, null: false
      t.references :question, null: false

      t.timestamps
    end
  end
end
