Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//option[@selected = 'selected' and contains(string(), value)]")
end

Given /^I am signed in as a user using "([^\"]*)"$/ do |email|
  step %{I have signed in with "#{email}"}
  @current_user = User.find_by_email(email)
end

Then /^I should see my API key$/ do
  page.should have_content("API key: " + @current_user.api_key)
end

Given /^I have (\d+) commits?$/ do |number|
  number.to_i.times { @current_user.commits.create }
end

Then /^I should see my ping URL$/ do
  page.should have_content("http://www.hulkort.com/api/commits/?api_key=" + @current_user.api_key)
end

Then /^I should see a list containing my commits$/ do
  page.should have_selector('ul li', :count => @current_user.commits.count)
end

Then /^I should see my commits graph$/ do
  page.should have_selector('div#user-commits-graph')
end

Then /^I should see the global commits graph$/ do
  page.should have_selector('div#global-commits-graph')
end

Then /^I should see the repository commits graph$/ do
  page.should have_selector('div#repository-commits-graph')
end

Given /^there is a repository named "(.*)"$/ do |repository_name|
  Repository.create(:name => repository_name)
end
