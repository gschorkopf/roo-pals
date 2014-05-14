class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Welcome, #{@user.first_name}"
    else
      render 'sessions/new', alert: "Something went wrong!"
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
