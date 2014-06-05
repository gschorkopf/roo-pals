class DashboardController < ApplicationController
  def show
    @schedule = Schedule.new

    @show_groups = day_shows.values
    @days = day_shows.keys
    @shows_by_popularity = followed_shows.by_popularity.limit(15).decorate

    @followed_users = current_user.followed_users.by_name.decorate
    @followable_users = current_user.followable_users.by_name.decorate
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
