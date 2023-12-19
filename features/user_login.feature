Feature: Dinnect - Login Process
  As a Columbia University student
  So that I can access my account and connect with peers
  I want to use the Dinnect platform to log in

Background: Users on Dinnect platform
  Given the following users exist:
    | email             | username | password     |
    | alice@email.edu| al1234   | 123123   |
    | bob@email.edu  | bo1234   | 123123  |

Scenario: Login to Dinnect with username and then logout 
  When I go to the Log in page
  And I fill in "Username or Email Address" with "al1234"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the User page for "al1234"
  Then I should see "User Profile"
  And I follow "Logout"
  Then I should be logged out
  Then I go to the Home page
  

Scenario: Login to Dinnect with email then logout 
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "alice@email.edu"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the User page for "al1234"
  Then I should see "User Profile"
  And I follow "Logout"
  Then I should be logged out
  Then I go to the Home page


Scenario: Login to Dinnect with wrong pwd 
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "alice@email.edu"
  And I fill in "Password" with "111111"
  And I press "Login"
  Then I should be on the Log in page
  Then I should see "Invalid username/email and password combination"

Scenario: Login to Dinnect with wrong email 
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "wrong@email.com"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the Log in page 
  And I should see "Invalid username/email and password combination"

Scenario: Login to Dinnect with wrong username
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "duke"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the Log in page
  And I should see "Invalid username/email and password combination"