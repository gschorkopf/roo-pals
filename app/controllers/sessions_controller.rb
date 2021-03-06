class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: sign_in_params[:email])

    if @user && @user.authenticate(sign_in_params[:password])
      sign_in(@user)
      redirect_to root_path, notice: "Welcome, #{current_user.first_name}!"
    else
      redirect_to root_path, notice: "Please make sure your password and email are correct"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  private

  def sign_in_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
