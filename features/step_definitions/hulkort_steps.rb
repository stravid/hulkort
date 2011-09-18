Given /^I am signed in as a user$/ do
  Given %{I sign in}
end

Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), value)]") 
end