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

Given /^I have (\d+) commits?$/ do |number|
  number.to_i.times { @current_user.commits.create }
end

Then /^I should see my ping URL$/ do
  page.should have_content("http://hulkort.herokuapp.com/api/commits/?api_key=" + @current_user.api_key)
end

Then /^I should see a list containing all my commits$/ do
  page.should have_selector('ul li', :count => @current_user.commits.count)
  page.all('ul li').detect do |li|
    li.should have_content("commited at")
    li.should have_content("No.")
  end.should be_present
end
