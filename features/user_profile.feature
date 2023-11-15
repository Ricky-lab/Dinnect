Feature: Dinnect - User Profile Management
  As a Columbia University student
  So that I can view and update my profile information
  I want to manage my profile on the Dinnect platform

Background: Existing Users
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | Vegetarian   |
    | bob@columbia.edu  | bo1234   | Gluten-Free  |

Scenario: Viewing own profile
  When I go to the User page for "al1234"
  Then I should see "User Profile"
  And I should see "Email: alice@columbia.edu"

Scenario: Create/Edit profile information
  When I go to the Registration page
  And I fill in "Username" with "al1234"
  And I fill in "Email" with "alice@columbia.edu"
  And I fill in "Password" with "Vegetarian"
  And I press "Sign Up"
  Given I am on the Log in page
  And I fill in "Username or email" with "al1234"
  And I fill in "Password" with "Vegetarian"
  And I press "Log In"
  Then I should be on the User page for "al1234"
  Then I should see "Welcome, al1234!"

  When I go to the User page for "al1234"
  And I follow "Edit Profile"
  Then I should be on the Profile page
  And I fill in "First name" with "Alice"
  And I fill in "Last name" with "Johnson"
  And I fill in "Class name" with "COMSW4152"
  And I fill in "School" with "Columbia University"
  And I fill in "Major" with "Computer Science"
  And I fill in "Dietary preference" with "Vegetarian"

  And I press "Create Profile"
  Then I should be on the User page for "al1234"
  Then I should see "First Name: Alice"
  Then I should see "Last Name: Johnson"
  And I should see "Class Name: COMSW4152"
  And I should see "School: Columbia University"
  And I should see "Major: Computer Science"
  And I should see "Dietary Preference: Vegetarian"
  And I should see "Email: alice@columbia.edu"
