class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def redirect_based_on_login
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to login_path
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  # Custom method for authentication
  def authenticate_user(user_id)
    unless current_user && current_user.id == user_id
      flash[:danger] = "You are not authorized to access this information."
      redirect_to root_path
    end
  end

end
