class Festival < ActiveRecord::Base
  validates :name, presence: true
  has_many :schedules, dependent: :destroy
end
