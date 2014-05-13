class Schedule < ActiveRecord::Base
  validates :user_name, :url, presence: true
  validates :user_name, :url, uniqueness: true
end
