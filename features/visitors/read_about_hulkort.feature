Feature: Visitors can read about Hulkort

In order to get an idea of what Hulkort is
As a visitor
I can read about Hulkort

Scenario: Visitor visits Hulkort
  Given I am on the homepage
  Then I should see "What is Hulkort?"
  And I should see "How does it work?"