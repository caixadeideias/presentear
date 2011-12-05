# encoding: utf-8

Dado /^eu preencho nome com "(.*)"$/ do |value|
  When %{I fill in "event[gifted]" with "#{value}"}
end

Dado /^eu preencho "(.*)" como tipo$/ do |value|
  When %{I fill in "event[event_type]" with "#{value}"}
end

Dado /^eu preencho a data como sendo amanhã$/ do
  fill_in("event[limit_date]", :with => Date.tomorrow)
end
