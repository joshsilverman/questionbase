class AddScoreToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :score, :integer, :default => 1600
  end

  def self.down
    remove_column :questions, :score
  end
end
