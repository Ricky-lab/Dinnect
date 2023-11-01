Feature: Dinnect - Connecting Columbia's Culinary and Social Journey

  As a Columbia University student
  So that I can find suitable dining companions and engage in campus activities
  I want to use the Dinnect platform to connect with like-minded peers

Background: Users on Dinnect platform

  Given the following users exist:
    | email             | uni    | dietary_preferences | 
    | alice@columbia.edu| al1234 | Vegetarian          | 
    | bob@columbia.edu  | bo1234 | Gluten-Free         | 

Scenario: Register on Dinnect
  When I go to the Registration page
  And I fill in the following:
    | Field             | Value              |
    | Email             | charlie@columbia.edu|
    | UNI               | ch1234             |
    | Password          | securepassword     |
    | Confirm Password  | securepassword     |
  And I press "Register"
  Then I should see "Welcome, Charlie! Your registration is successful."

Scenario: Login to Dinnect
  Given I am on the Login page
  When I fill in "Email" with "alice@columbia.edu"
  And I fill in "Password" with "password1"
  And I press "Login"
  Then I should see "Welcome, Alice!"  # Update this line to match the message displayed by your application

Scenario: Create and Edit Profile
  Given I am logged in as "alice@columbia.edu"
  When I go to the Edit Profile page
  And I fill in "Dietary Preferences" with "Vegan, Nut-Free"
  And I press "Save Changes"
  Then my dietary preferences should be "Vegan, Nut-Free"

Scenario: Create Dining Event
  Given I am logged in as "alice@columbia.edu"
  When I go to the Create Dining Event page
  And I fill in the following:
    | Field       | Value       |
    | Title       | Lunch Event |
    | Location    | Butler Library |
    | Date        | 2023-10-25  |
    | Time        | 12:30 PM    |
  And I press "Create Event"
  Then I should see "Your dining event 'Lunch Event' has been created."

Scenario: Join Dining Event
  Given I am logged in as "bob@columbia.edu"
  When I go to the Events page
  And I follow "Join" for "Lunch Event"
  Then I should see "You have joined 'Lunch Event'."

Scenario: Search and Match with Dining Companions
  Given I am logged in as "alice@columbia.edu"
  When I go to the Search page
  And I select "Gluten-Free" in dietary preferences
  And I press "Search"
  Then I should see "bob@columbia.edu"
