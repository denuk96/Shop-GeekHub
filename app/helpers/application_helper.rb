module ApplicationHelper
  def set_page_title(title)
    content_for :product_title, title
  end
end
