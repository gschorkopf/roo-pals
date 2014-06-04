class DashboardController < ApplicationController
  def show
    @schedule = Schedule.new
    @show_groups = day_shows.values
    @days = day_shows.keys
    @users = current_user.followed_users
    @popularity = followed_shows.by_popularity.limit(15).decorate
  end

  private

  def followed_shows
    current_user.followed_shows
  end

  def day_shows
    @day_shows ||= followed_shows
      .by_starting_at
      .decorate
      .group_by(&:day)
  end
end
