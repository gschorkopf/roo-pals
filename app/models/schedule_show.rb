class ScheduleShow < ActiveRecord::Base
  validates :schedule, :show, presence: true
  validates_uniqueness_of :schedule, scope: :show

  belongs_to :schedule
  belongs_to :show
end
