class Question < ActiveRecord::Base
    belongs_to :chapter
    belongs_to :user
    
  WINNING_PTS = 1.0
  LOSING_PTS = 0.0
  DRAW_PTS = 0.5
  K_VALUE = 20
    
  def self.update_scores(winner, loser, tie=0)
    w_score_diff = loser.score - winner.score
    l_score_diff = winner.score - loser.score
    puts "loser score: #{loser.score}"
    puts "winner score: #{winner.score}"
    puts "diff: #{w_score_diff}"
    puts "diff over 400: #{w_score_diff/400.0}"
    puts "plus one: #{w_score_diff/400.0 + 1}"
    puts "ten to the power: #{10.00 ** ((w_score_diff/400.0) + 1)}"
    puts 1 / (10.000 ** (w_score_diff/400.0) + 1)
    winners_win_prob = 1 / (10.000 ** (( loser.score - winner.score)/400.0) + 1)
    losers_win_prob = 1 / (10.000 **(( winner.score - loser.score)/400.0) + 1)
    
    if tie.to_i == 1
      puts "TIE!"
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
