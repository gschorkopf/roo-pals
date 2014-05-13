class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token])
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
