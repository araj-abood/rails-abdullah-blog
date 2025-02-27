class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'You must be logged in to perform that actions'
      redirect_to login_path
    end
  end
end
