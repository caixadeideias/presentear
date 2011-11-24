module ApplicationHelper
  def link_to_if_present(link, name, options = {})
    
    if link.present?
      link_to(name, link, options) 
    else
      name
    end
  
  end
end
