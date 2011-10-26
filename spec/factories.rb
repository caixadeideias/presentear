# encoding: utf-8

Factory.define :event do |event|
  event.gifted "Joãozinho"
  event.event_type "festa de aniversário"
  event.limit_date Date.current.iso8601 
end

Factory.define :expired_event, :parent => :event do |event|
  event.limit_date "2008-10-10"  
end

Factory.define :idea do |idea|
  idea.name "Bola de futebol"
  idea.link "http://www.google.com"
  idea.association :event
end