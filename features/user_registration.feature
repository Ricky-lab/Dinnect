Feature: Dinnect - Registration Process
  As a Columbia University student
  So that I can register and engage in campus activities
  I want to use the Dinnect platform to create an account

Background: Users on Dinnect platform
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | Vegetarian   |
    | bob@columbia.edu  | bo1234   | Gluten-Free  |

Scenario: Register on Dinnect
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Then I should be on the Log in page

Scenario: Register on Dinnect with an invalid email
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Then I should be on the Registration page

Scenario: Register on Dinnect with a repeated email
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  When I go to the Registration page
  And I fill in "Username" with "duke"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromduke"
  And I press "Sign Up"
  Then I should be on the Registration page

Scenario: Register on Dinnect with a repeated username
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "uncch@unc.edu"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign Up"
  Given I am on the Log in page
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email" with "columbia@columbia.edu"
  And I fill in "Password" with "igraduatedfromduke"
  And I press "Sign Up"
  Then I should be on the Registration page