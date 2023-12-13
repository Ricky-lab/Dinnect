Feature: Dinnect - Login Process
  As a Columbia University student
  So that I can access my account and connect with peers
  I want to use the Dinnect platform to log in

Background: Users on Dinnect platform
  Given the following users exist:
    | email             | username | password     |
    | alice@email.edu| al1234   | Vegetarian   |
    | bob@email.edu  | bo1234   | Gluten-Free  |

Scenario: Login to Dinnect with username and then logout 
  When I go to the Log in page
  And I fill in "Username or Email Address" with "al1234"
  And I fill in "Password" with "Vegetarian"
  And I press "Log In"
  Then I should be on the User page for "al1234"
  Then I should see "User Profile"
  And I follow "Logout"
  Then I should be logged out
  Then I go to the Home page
  

Scenario: Login to Dinnect with email then logout 
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the User page for "uncch"
  Then I should see "User Profile"
  And I follow "Logout"
  Then I should be logged out
  Then I go to the Home page


Scenario: Login to Dinnect with wrong pwd 
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromduke"
  And I press "Log In"
  Then I should be on the Log in page
  Then I should see "Invalid username/email and password combination"
  And I fill in "Username or Email Address" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the User page for "uncch"
  Then I should see "User Profile"

Scenario: Login to Dinnect with wrong email 
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "uncch@duke.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the Log in page and see "Invalid username/email and password combination"
  And I fill in "Username or Email Address" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the User page for "uncch"
  Then I should see "User Profile"

Scenario: Login to Dinnect with wrong username
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "duke"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the Log in page and see "Invalid username/email and password combination"
  And I fill in "Username or Email Address" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Log In"
  Then I should be on the User page for "uncch"
  Then I should see "User Profile"