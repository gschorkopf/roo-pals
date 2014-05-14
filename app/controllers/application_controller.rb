class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user, :logged_in?, :current_schedule

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token])
  end

  def current_schedule
    @current_schedule ||= current_user.schedule
  end

  def logged_in?
    current_user.present?
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

  def sign_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end
end
