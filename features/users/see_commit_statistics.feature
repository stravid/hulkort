Feature: Users can see their commit statistics
  In order the see how much I work
  As a user
  I can see my commit statistics

Scenario:
  Given I am signed in as a user using "mail@example.com"
  And I have 5 commits
  And I am on the homepage
  When I follow "Statistics"
  Then I should see "Commits Log"
  And I should see a list containing my commits

Scenario:
  Given I am signed in as a user using "mail@example.com"
  And I have 0 commits
  And I am on the homepage
  When I follow "Statistics"
  Then I should see "We didn´t track any data"

Scenario: User can see his personal commit statistics
  Given I am signed in as a user using "mail@example.com"
  And I have 5 commits
  And I am on the homepage
  When I follow "Statistics"
  Then I should see "Your Statistics"
  And I should see "Total Commits: 5"
  And I should see my commits graph

Scenario: User can see his personal commit statistics
  Given I am signed in as a user using "mail@example.com"
  And I have 3 commits
  And I am on the homepage
  Then I should see "Global Statistics"
  And I should see "Total Commits: 3"
  And I should see the global commits graph