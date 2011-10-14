Dado /^que estou na página inicial$/ do
  visit root_path
end

Dado /^eu preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
  fill_in field, with: value
end

Dado /^eu escolho "([^"]*)" no "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Quando /^eu pressiono "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end