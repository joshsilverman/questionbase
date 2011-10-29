class StaticController < ApplicationController
  def home
    puts current_user.to_json
    if current_user
        redirect_to :action => "index", :controller => "books"
    end
  end
end
