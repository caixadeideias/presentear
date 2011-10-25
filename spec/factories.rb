# encoding: utf-8

Factory.define :event do |event|
  event.gifted "Joãozinho"
  event.event_type "festa de aniversário"
  event.limit_date "2011-12-08"  
end

Factory.define :idea do |idea|
  idea.name "Bola de futebol"
  idea.link "http://www.google.com"
  idea.association :event
end