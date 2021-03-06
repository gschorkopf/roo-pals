class ShowDecorator < Draper::Decorator
  delegate_all
  decorates_association :schedules

  def artist_title
    h.truncate(artist_name, length: 50)
  end

  def time_frame
    "#{pretty_time(starting_at)} - #{pretty_time(ending_at)}"
  end

  def time_frame_with_day
    "#{day}: #{time_frame}"
  end

  def show_classes(always_show: false)
    hide_class = 'hideable' unless always_show
    location_class = h.camelcased(location)
    "#{hide_class} #{location_class}"
  end

  private

  def pretty_time(time)
    time.strftime('%l:%M %p')
  end
end
