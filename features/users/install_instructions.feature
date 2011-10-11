Feature: User can see install instructions
  In order to know how to track my commit statistics
  As a user
  I can read the install instructions

Background:
  Given I am signed in as a user using "mail@example.com"

Scenario:
  Given I have 0 commits
  And I am on the homepage
  Then I should see my ping URL
  And I should not see "just sign in"

Scenario:
  Given I have 1 commit
  And I am on the homepage
  Then I should see "Your Statistics"