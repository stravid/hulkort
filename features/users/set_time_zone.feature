Feature: Users can set their time zone.
  In order to see correct times and dates
  As a user
  I can set my time zone

Scenario: User sets time zone
  Given I am signed in as a user using "mail@example.com"
  And I follow "Account Settings"
  And I select "Amsterdam" from "Time zone"
  And I press "Save"
  Then "Amsterdam" should be selected for "Time zone"