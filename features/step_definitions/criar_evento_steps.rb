Dado /^I select "(.*)" as the date$/ do |value|
  select_date "event_limit_date", with: value
end

Dado /^eu preencho nome com "(.*)"$/ do |value|
  When %{I fill in "event_gifted" with "#{value}"}
end

Dado /^eu seleciono "(.*)" como tipo$/ do |value|
  When %{I select "#{value}" from "event_type"}
end

Dado /^eu preencho data com "(.*)"$/ do |value|
  When %{I fill in "event_limit_date" with "#{value}"}
end
