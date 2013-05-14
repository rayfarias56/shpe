module ApplicationHelper
  def full_title(page_title)
    base_title = "SHPE UIUC"
    if page_title.empty?
    base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def admin?(user)
  	user.admin
  end
end
