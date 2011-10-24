# encoding: utf-8

FactoryGirl.define do
  factory :event do
    gifted "Joãozinho"
    event_type "festa de aniversário"
    limit_date "2011-12-08"
  end
  
  factory :idea do
    name "Bola de futebol"
    link "http://www.google.com"
    association :event
  end
end