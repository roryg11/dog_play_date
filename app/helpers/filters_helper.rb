module FiltersHelper
  def sti_filter_path(type = "filter", filter = nil, action = nil)
    send "#{format_sti(action, type, filter)}_path", filter
  end

  def format_sti(action, type, filter)
    action || filter ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
