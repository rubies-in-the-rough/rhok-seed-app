module ApplicationHelper
  #
  # Provide the appropriate class identifier for the page
  #  This helps mark the active page as active in the nav menu
  #
  def current_page_class(page)
    return "class='active'" if current_page?(page)
    return ""
  end
end
