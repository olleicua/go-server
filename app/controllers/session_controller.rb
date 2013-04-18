class SessionController < ApplicationController
  
  skip_before_filter :require_login
  
  def login_page
  end
  
  def login
    username = params[:username].strip.downcase
    user = User.find_by_username username
    if user.nil?
      user = User.new :username => username
      user.save
    end
    session[:user] = user.id
    redirect_to '/games/my_turn'
  end
  
  def logout
    session[:user] = nil
    redirect_to '/login'
  end
  
end
