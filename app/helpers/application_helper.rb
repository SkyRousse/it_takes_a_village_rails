module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, url_for(:sort => column, :direction => direction, :page => nil), {:class => css_class, :remote => true}
  end
  def title(text)
    content_for :title, text
  end
  def body_class
    [controller_name, action_name].join('-')
  end
end
