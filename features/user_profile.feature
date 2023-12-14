Feature: Dinnect - User Profile Management
  As a Columbia University student
  So that I can view and update my profile information
  I want to manage my profile on the Dinnect platform

Background: Existing Users
  Given the following users exist:
    | email             | username | password     |
    | alice@columbia.edu| al1234   | 123123   |
    | bob@columbia.edu  | bo1234   | 123123  |
  Given I am on the Log in page
  And I fill in "Username or Email Address" with "al1234"
  And I fill in "Password" with "123123"
  And I press "Login"
  Then I should be on the User page for "al1234"
  Then I should see "User Profile"

Scenario: Viewing own profile
  When I go to the User page for "al1234"
  Then I should see "User Profile"
  And I should see "Email: alice@columbia.edu"

Scenario: Create/Edit profile information
  When I go to the User page for "al1234"
  And I follow "Edit Profile"
  Then I should be on the Edit Profile page for "al1234"

  When I fill in "First name" with "Alice"
  And I fill in "Last name" with "Johnson"
  And I fill in "Class name" with "COMSW4152"
  And I fill in "School" with "Columbia University"
  And I fill in "Major" with "Computer Science"
  And I fill in "Dietary preference" with "Vegetarian"

  And I press "Update Profile"
  Then I should be on the User page for "al1234"
  Then I should see "First Name: Alice"
  Then I should see "Last Name: Johnson"
  And I should see "Class Name: COMSW4152"
  And I should see "School: Columbia University"
  And I should see "Major: Computer Science"
  And I should see "Dietary Preference: Vegetarian"
  And I should see "Email: alice@columbia.edu"

# Scenario: Cancel editing a user profile
    # When I am on the User page for "al1234"
    # And I remember the profile information
    # And I follow "Edit Profile" 
    # Then I should be on the Edit Profile page for "al1234"

    # When I fill in "First name" with "Alice"
    # And I fill in "Last name" with "Johnson"
    # And I fill in "Class name" with "COMSW4152"
    # And I fill in "School" with "Columbia University"
    # And I fill in "Major" with "Computer Science"
    # And I fill in "Dietary preference" with "Vegetarian"

    # When I follow "Back to Profiles"
    # Then I should be on the User page for "al1234"
    # And the profile information should be unchanged
