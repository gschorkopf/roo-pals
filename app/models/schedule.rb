class Schedule < ActiveRecord::Base
  validates :user_name, :url, presence: true
  validates :user_name, :url, uniqueness: true
  has_many :schedule_shows
  has_many :shows, through: :schedule_shows

 auto_strip_attributes :user_name, squish: true
end
