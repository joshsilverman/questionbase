class Question < ActiveRecord::Base
    belongs_to :chapter
    belongs_to :user
    
  WINNING_PTS = 1.0
  LOSING_PTS = 0.0
  DRAW_PTS = 0.5
  K_VALUE = 20
    
  def self.update_scores(winner, loser, tie=false)
    winners_win_prob = 1 / (10.0 ** (( loser.score - winner.score)/400.0) + 1)
    losers_win_prob = 1 / (10.0 **(( winner.score - loser.score)/400.0) + 1)
    
    puts winners_win_prob
    puts losers_win_prob
    
    if tie
      winner.update_score(DRAW_PTS, winners_win_prob)
      loser.update_score(DRAW_PTS, losers_win_prob)
    else
      puts "update winner"
      winner.update_score(WINNING_PTS, winners_win_prob)
      puts "update loser"
      loser.update_score(LOSING_PTS, losers_win_prob)
    end
  end
  
  def self.get_random_question
    max = Question.last.id
    question = nil
    while question.nil?
      question = Question.find(Random.rand(max) + 1)
    end
    return question
  end
  
  def get_related_question
    score = self.score
    related_questions = Question.where("score < ? and score > ? and id != ?", score+100, score-100, self.id)
    puts related_questions
    rel_question = related_questions[Random.rand(related_questions.size)]
    return rel_question
  end
  
  def update_score(scoring_pts, win_prob)
    puts "OLD SCORE: "
    puts self.score
    new_score = self.score + (K_VALUE * (scoring_pts - win_prob))
    self.update_attribute(:score, new_score)
    puts "NEW SCORE: "
    puts self.score
  end
  
  
end
