module ApplicationHelper
  def current_page_class(page)
    return "class='active'" if current_page?(page)
    return ""
  end
end
