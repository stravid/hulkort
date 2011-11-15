Feature: Visitors can see the graph of a repository
  In order to see the commit graph of a certain repository
  As a visitor
  I can access the graph through a URL

Scenario:
  Given there is a repository named "Test"
  And I am on the "Test" repository graph page
  Then I should see the repository commits graph