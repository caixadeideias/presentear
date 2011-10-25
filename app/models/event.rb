# encoding: utf-8

class Event < ActiveRecord::Base
  has_many :ideas
  
  validates_presence_of :gifted, :event_type, :limit_date
  
  before_save :generate_token
  
  EVENT_TYPE_OPTIONS = ["uma festinha qualquer","festa de aniversário","amigo secreto","festa de casamento","festa de divórcio","despedida de solteiro"]
  
  def generate_token
    i = 0
    
    begin
      self.token = gifted.parameterize
      self.token << i.to_s unless i < 1
      i += 1
    end while Event.exists?(token: self.token)
  end
  
end
