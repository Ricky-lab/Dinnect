Feature: Dinnect - User Event Management
  As a Columbia University student
  So that I can view and manage my events
  I want to interact with events on the Dinnect platform

Background: Existing Users and Logged In
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | Vegetarian   |
    | bob@columbia.edu  | bo1234   | Gluten-Free  |
  When I go to the Registration page
  And I fill in "Username" with "al1234"
  And I fill in "Email" with "alice@columbia.edu"
  And I fill in "Password" with "Vegetarian"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "al1234"
  And I fill in "Password" with "Vegetarian"
  And I press "Log In"
  Then I should be on the User page for "al1234"
  Then I should see "Welcome, al1234!"

Scenario: Navigating to All Events page from Profile page
  When I go to the User page for "al1234"
  And I follow "Go to Events"
  Then I should be on the All Events page
  And I should see "All Events"

Scenario: Navigating to My Events from All Events
  When I go to the All Events page
  When I follow "My Events"
  Then I should be on the My Events page for 'al1234'
  And I should see "My Events"

Scenario: Navigating to Profile from All Events
  When I go to the All Events page 
  When I follow "My Profile"
  Then I should be on the User page for "al1234"
  And I should see "User Profile"

Scenario: Navigating to Profile from My Events
  When I go to the All Events page 
  When I follow "My Profile"
  Then I should be on the User page for "al1234"
  And I should see "User Profile"

Scenario: Viewing Holder Events
  When I go to the All Events page 
  When I follow "My Profile"
  Then I should be on the User page for "al1234"

Scenario: Viewing Participator Events
  When I go to the All Events page 
  When I follow "My Profile"
  Then I should be on the User page for "al1234"
