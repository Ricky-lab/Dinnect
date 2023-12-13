Feature: Dinnect - Registration Process
  As a Columbia University student
  So that I can register and engage in campus activities
  I want to use the Dinnect platform to create an account

Background: Users on Dinnect platform
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | 123123   |
    | bob@columbia.edu  | bo1234   | 123123  |

Scenario: Register on Dinnect successfully
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email address" with "uncch@unc.edu"
  And I fill in "Password" with "123123"
  And I press "Sign up"
  Then I should be on the Log in page and I should see "Sign-up was successful. You can now log in."

Scenario: Register on Dinnect with a repeated email
  When I go to the Registration page
  And I fill in "Username" with "ch1234"
  And I fill in "Email address" with "alice@columbia.edu"
  And I fill in "Password" with "123123"
  And I press "Sign up"
  Then I should be on the Registration page and see "Email has already been taken"

Scenario: Register on Dinnect with a repeated username
  When I god to the Registration page
  And I fill in "Username" with "al1234"
  And I fill in "Email address" with "charlie@columbia.edu"
  And I fill in "Password" with "123123"
  And I press "Sign up"
  Then I should be on the Registration page and see "Username has already been taken"

Scenario: Register on Dinnect with an invalid email
  When I go to the Registration page
  And I fill in "Username" with "uncch"
  And I fill in "Email address" with "uncch"
  And I fill in "Password" with "igraduatedfromuncch23"
  And I press "Sign up"
  Then I should be on the Registration page
