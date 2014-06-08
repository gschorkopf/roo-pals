module DashboardHelper
  def day_navigator(day, i)
    content_tag(:li, day_link(day), class: navigator_class(i))
  end

  def stage_navigator(stage)
    content_tag(:li, stage_link(stage), class: "togglers")
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

  def day_link(day)
    link_to t("days.#{underscored(day)}"), "##{day}", data: { toggle: 'pill' }
  end

  def stage_link(stage)
    link_to t("stages.#{underscored(stage)}"), "#", data: { toggle: 'pill', stage: ".#{camelcased(stage)}" }
  end
end
