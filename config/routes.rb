Questionbase::Application.routes.draw do
  resources :books
  resources :chapters
  resources :questions

  match "questions/save_question" => "questions#save_question", :as => :save_question_path
  match "auth/facebook/callback" => "sessions#create"
  match "signout" => "sessions#destroy", :as => :signout
  
  match "compare_question" => "questions#compare_question"
  match "questions/update_question_scores/:winner_id/:loser_id/:tie" => "questions#update_question_scores"

  root :to => "static#home"
  # root :to => "books#index"
end
