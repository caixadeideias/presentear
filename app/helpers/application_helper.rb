#encoding: utf-8

module ApplicationHelper
  def link_to_if_present(link, name, options = {})
    if link.present?
      link = "http://" + link
      link_to(name, link, options) 
    else
      name
    end
  end
end
