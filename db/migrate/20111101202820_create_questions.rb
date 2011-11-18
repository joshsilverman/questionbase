class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :topic
      t.string :correct_answer
      t.string :incorrect_answer1
      t.string :incorrect_answer2
      t.string :incorrect_answer3
      t.integer :user_id
      t.integer :chapter_id
      t.integer :score

      t.timestamps
    end
  end
end
