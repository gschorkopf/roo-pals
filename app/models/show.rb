class Show < ActiveRecord::Base
  validates :artist_name, :starting_time, :ending_time, :day, :location, presence: true
  validates :artist_name, uniqueness: true
  has_many :schedule_shows
  has_many :schedules, through: :schedule_shows

  auto_strip_attributes :artist_name, :location, :day, squish: true
end
