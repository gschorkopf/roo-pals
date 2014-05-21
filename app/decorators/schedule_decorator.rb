class ScheduleDecorator < Draper::Decorator
  delegate_all

  def attending_class(show)
    'panel-info' if attending?(show)
  end

  def user_name
    h.current_user == user ? h.t('misc.me') : user.first_name
  end

  def schedule_class
    "schedule-#{id}"
  end
end
