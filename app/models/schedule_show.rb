class ScheduleShow < ActiveRecord::Base
  validates :schedule, :show, presence: true
  belongs_to :schedule
  belongs_to :show
end
