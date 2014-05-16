class ScheduleDecorator < Draper::Decorator
  delegate_all

  def attending_class(show)
    'panel-info' if attending?(show)
  end

  def user_name
    user.first_name
  end
end
