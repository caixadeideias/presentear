# encoding: utf-8

class DateValidator < ActiveModel::Validator
  
  def validate(record)
    if record.limit_date.present? && record.limit_date < Date.current  
      record.errors[:base] << "Com essa data limite o evento já teria ocorrido." 
    end
  end
  
end