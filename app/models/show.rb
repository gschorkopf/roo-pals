class Show < ActiveRecord::Base
  validates :artist_name, :starting_time, :ending_time, presence: true
  validates :artist_name, uniqueness: true
end
