module DashboardHelper
  def schedule_navigator(day, i)
    content_tag(:li, schedule_link(day), class: navigator_class(i))
  end

  def navigator_class(i)
    i == 0 ? 'active' : ''
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

  private

  def schedule_link(day)
    link_to t("days.#{day.downcase}"), "##{day}", data: { toggle: 'pill' }
  end
end
