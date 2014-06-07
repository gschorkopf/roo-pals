module DashboardHelper
  def schedule_navigator(day, i)
    content_tag(:li, schedule_link(day), class: navigator_class(i))
  end

  def stage_navigator(stage, i)
    content_tag(:li, stage_link(stage), class: "#{navigator_class(i)} togglers")
  end

  def navigator_class(i)
    i == 0 ? 'active' : ''
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-warning"
    end
  end

  private

  def schedule_link(day)
    link_to t("days.#{day.downcase}"), "##{day}", data: { toggle: 'pill' }
  end

  def stage_link(stage)
    link_to t("stages.#{stage.downcase}"), "#", data: { toggle: 'pill', stage: stage }
  end
end
