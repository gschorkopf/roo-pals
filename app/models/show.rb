class Show < ActiveRecord::Base
  validates :artist_name, :starting_at, :ending_at, :day, :location, presence: true
  validates :artist_name, uniqueness: true
  has_many :schedule_shows, dependent: :destroy
  has_many :schedules, through: :schedule_shows

  scope :by_starting_at, -> { order(:starting_at, :ending_at) }
  scope :by_popularity, -> { order(schedules_count: :desc) }

  auto_strip_attributes :artist_name, :location, :day, squish: true
end
