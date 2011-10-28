class StaticController < ApplicationController
  def home
    if current_user
        redirect_to :action => "index", :controller => "books"
    end
  end
end
