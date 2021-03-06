class ApplicationController < ActionController::Base

  before_action :current_user

  def current_user
    return @current_user = User.find_by(id: session[:user_id])
  end

  def require_login
    if current_user.nil?
      flash[:error] = "A problem occurred: You must log in to do that"
      redirect_to root_path
    end
  end
end
