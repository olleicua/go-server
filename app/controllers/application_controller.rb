class ApplicationController < ActionController::Base
  
  before_filter :require_login
  
  def root
    redirect_to '/games/my_turn'
  end
  
  def current_user
    User.find_by_id session[:user]
  end
  
  private
  
  def require_login
    if current_user
      @current_user = current_user
    else
      redirect_to '/login'
    end
  end

  protect_from_forgery
end
