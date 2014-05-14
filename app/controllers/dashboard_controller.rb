class DashboardController < ApplicationController
  def show
    @thursday_shows = Show.where(day: "Thursday")
    @friday_shows = Show.where(day: "Friday")
    @saturday_shows = Show.where(day: "Saturday")
    @sunday_shows = Show.where(day: "Sunday")
    @schedule = Schedule.new

  end
end
