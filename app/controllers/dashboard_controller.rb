class DashboardController < ApplicationController
  def show
    @schedule = Schedule.new

    @thursday_shows = Show.where(day: "Thursday").includes(:schedules)
    @friday_shows = Show.where(day: "Friday").includes(:schedules)
    @saturday_shows = Show.where(day: "Saturday").includes(:schedules)
    @sunday_shows = Show.where(day: "Sunday").includes(:schedules)
  end
end
