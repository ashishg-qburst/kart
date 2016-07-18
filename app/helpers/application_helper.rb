module ApplicationHelper
  def full_title(page_title = '')
    if page_title.empty?
      "Kart"
    else
      "#{page_title} | Kart"
    end
  end
end
