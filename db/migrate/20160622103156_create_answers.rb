class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, null: false
      t.string :answer, null: false

      t.timestamps
    end
  end
end
