class Event < ActiveRecord::Base
  validates_presence_of :gifted, :type, :limit_date
  
  before_save :generate_token
  
  def generate_token
    i = 0
    
    begin
      self.token = gifted.parameterize
      self.token << i.to_s unless i < 1
      i += 1
    end while Event.exists?(token: self.token)
  end
end
