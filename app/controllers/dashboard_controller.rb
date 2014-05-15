class DashboardController < ApplicationController
  def show
    @schedule = Schedule.new
    @shows = Show.all.includes(:schedules).by_starting_at
    @days = @shows.pluck(:day).uniq.map(&:downcase)
  end
end
