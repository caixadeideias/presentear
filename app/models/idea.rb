class Idea < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :name
  
  def link=(value)
    write_attribute(:link, value.gsub("http://",""))
  end
end