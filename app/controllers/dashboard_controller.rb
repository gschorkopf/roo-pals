class DashboardController < ApplicationController
  def show
    @schedule = Schedule.new
    @show_groups = day_shows.values
    @days = day_shows.keys
  end

  private

  def day_shows
    @day_shows ||= Show.includes(:schedules)
      .by_starting_at
      .decorate
      .group_by(&:day)
  end
end
