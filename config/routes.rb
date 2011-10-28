Questionbase::Application.routes.draw do
  resources :books
  resources :chapters
  resources :questions

  match "questions/save_question" => "questions#save_question"
  match "auth/facebook/callback" => "sessions#create"
  match "signout" => "sessions#destroy", :as => :signout

  root :to => "static#home"
end
