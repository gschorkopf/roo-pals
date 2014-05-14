class SchedulesController < ApplicationController
  def create
    ScheduleUploader.perform(sign_in_params)
    redirect_to root_path
  end
  private

  def sign_in_params
    params.require(:schedule).permit(:url).merge(user: current_user)
  end
end
