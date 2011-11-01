class AddScoreToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :score, :integer, :default => 1600
    
    questions = Question.all
    questions.each do |q|
      q.update_attribute(:score, 1600)
    end
  end

  def self.down
    remove_column :questions, :score
  end
end
