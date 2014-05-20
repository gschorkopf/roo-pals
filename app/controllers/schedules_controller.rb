class SchedulesController < ApplicationController
  def create
    if ScheduleUploader.perform(sign_in_params)
      redirect_to root_path
    else
      @schedule = Schedule.new
      @schedule.errors.add(:url, "The URL entered was not found. Are you sure it is correct?")
      render 'dashboard/show'
    end
  end

  private

  def sign_in_params
    params.require(:schedule).permit(:url).merge(user: current_user)
  end
end
