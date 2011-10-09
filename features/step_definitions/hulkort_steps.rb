Given /^I am signed in as a user$/ do
  Given %{I sign in}
end

Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), value)]") 
end

Given /^I am signed in as a user using "([^\"]*)"$/ do |email|
  Given %{I have signed in with "#{email}"}
  @current_user = User.find_by_email(email)
end

Then /^I should see my API key$/ do
  page.should have_content("API key: " + @current_user.api_key)
end
