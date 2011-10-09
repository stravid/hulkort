Feature: User can see his API key
	In order to be able to use my API key
	As a user
	I can see my API key in my profile

Scenario:
	Given I am signed in as a user using "email@example.com"
	And I follow "Account Settings"
	Then I should see my API key