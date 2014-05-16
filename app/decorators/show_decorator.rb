class ShowDecorator < Draper::Decorator
  delegate_all
  decorates_association :schedules
end
