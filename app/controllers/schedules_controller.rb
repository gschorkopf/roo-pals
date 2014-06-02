class SchedulesController < ApplicationController
  def create
    if ScheduleUploader.perform(schedule_params)
      redirect_to root_path
    else
      @schedule = Schedule.new
      @schedule.errors.add(:profile_name, t('schedule.error'))
      render 'dashboard/show'
    end
  end

  def update
    current_schedule.schedule_shows.destroy_all
    ScheduleUploader.perform(user: current_user, profile_name: current_schedule.profile_name)
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:profile_name).merge(user: current_user)
  end
end
