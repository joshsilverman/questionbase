class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.string :topic
      t.string :correct_answer
      t.string :incorrect_answer_1
      t.string :incorrect_answer_2
      t.string :incorrect_answer_3
      t.integer :user_id
      t.integer :chapter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
