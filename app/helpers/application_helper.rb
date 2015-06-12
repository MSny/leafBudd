module ApplicationHelper
  #Place the name of your Site here... this will fill in the HTML title header
  def full_title(page_title= "")
    base_title = "Website: "
    if page_title.empty?
      base_title
    else
      "#{page_title}| #{base_title}"
    end
  end

  
end
