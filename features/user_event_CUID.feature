Feature: Dinnect - User Event Management
  As a Columbia University student
  So that I can view and manage my events
  I want to interact with events on the Dinnect platform

Background: Existing Users and Logged In
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | 123123   |
    | bob@columbia.edu  | bo1234   | 123123  |

  Given I am on the Log in page
  And I fill in "Username or Email Address" with "al1234"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the User page for "al1234"
  

Scenario: Viewing Holder Events
  When I go to the My Events page for 'al1234'
  When I press "Show Holder Events"


Scenario: Viewing Participator Events
  When I go to the My Events page for 'al1234'
  When I press "Show Participator Events"


Scenario: Create a New Event
  When I go to the My Events page for 'al1234'
  Then I should see "My Events"
  And I follow "New Event"
  Then I should be on the New Event page
  And I fill in "Title" with "event test"
  And I fill in "Description" with "description"
  And I fill in "Start time" with "12/14/2023, 03:51 PM"
  And I fill in "Duration" with "1"
  And I select "active" from "Status"
  And I fill in "Location name" with "550 W 120th St, New York, NY 10027, USA"
  And I fill in "Location coordinates" with "40.80754,-73.962579"
  And I press "Create Event"
  Then I should be on the All Events page
  And I should see "active"


Scenario: Edit the Event and save the edit
  When I go to the My Events page for 'al1234'
  Then I should see "My Events"
  And I follow "New Event"
  Then I should be on the New Event page
  And I fill in "Title" with "event test 111"
  And I fill in "Description" with "description"
  And I fill in "Start time" with "12/14/2023, 03:51 PM"
  And I fill in "Duration" with "1"
  And I select "active" from "Status"
  And I fill in "Location name" with "550 W 120th St, New York, NY 10027, USA"
  And I fill in "Location coordinates" with "40.80754,-73.962579"
  And I press "Create Event"
  Then I should be on the All Events page
  And I should see "active"

  When I go to the My Events page for 'al1234'
  When I press "Show Holder Events"
  When I press "Edit"
  Then I should see "Edit Your Event"
  And I select "full" from "Status"
  When I press "Update Event"
  And I press "All Events"
  Then I should see "full"



Scenario: Edit the Event but not save
  When I go to the My Events page for 'al1234'
  Then I should see "My Events"
  And I follow "New Event"
  Then I should be on the New Event page
  And I fill in "Title" with "event test 123"
  And I fill in "Description" with "description"
  And I fill in "Start time" with "12/14/2023, 03:51 PM"
  And I fill in "Duration" with "1"
  And I select "active" from "Status"
  And I fill in "Location name" with "550 W 120th St, New York, NY 10027, USA"
  And I fill in "Location coordinates" with "40.80754,-73.962579"
  And I press "Create Event"
  Then I should be on the All Events page
  And I should see "active"

  When I go to the My Events page for 'al1234'
  When I press "Show Holder Events"

  When I go to the My Events page for 'al1234'
  When I press "Show Holder Events"
  When I press "Edit"
  Then I should see "Edit Your Event"
  And I select "full" from "Status"
  When I press "Back"
  And I press "All Events"
  Then I should see "active"



