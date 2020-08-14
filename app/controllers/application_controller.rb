class ApplicationController < ActionController::Base
  private

  def logged_in_user
    @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in_user

  def user_is_authorized?(user)
    logged_in_user == user
  end

  helper_method :user_is_authorized?

  def user_is_admin?
    logged_in_user.admin?
  end

  helper_method :user_is_admin?

  def require_signin
    session[:intended_url] = request.url
    redirect_to new_session_url, alert: 'Please signin first!' unless logged_in_user
  end

  def require_admin
    redirect_to events_url, alert: 'Unauthorized access!' unless user_is_admin?
  end
end
