
Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        email = user['email']
        username = user['username']
        password = user['password']
        password_digest = BCrypt::Password.create(password)
        # Create users in your system using the provided attributes
        # Example:
        User.create!( username: username,email: email, password_digest: password_digest)
    end
  end

# For the scenario: Register on Dinnect
When /^I go to the Registration page$/ do
  visit new_user_path  # Assumes the route for the registration page is new_user_path
end

When /^I fill in the following:$/ do |table|
  table.hashes.each do |row|
    fill_in row["Field"], with: row["Value"]
  end
end

When /^I press "(.*)"$/ do |button_name|
  click_button(button_name)
end

Then /^I should see "(.*)"$/ do |text|
  expect(page).to have_content(text)
end

# For the scenario: Login to Dinnect
Given /^I am on the Login page$/ do
  visit login_path  # Assumes the route for the login page is login_path
end

# For the scenario: Create and Edit Profile
Given /^I am logged in as "(.*)"$/ do |email|
  user = User.find_by_email(email)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"  # Assumes the password is "password"
  click_button "Login"
end

When /^I go to the Edit Profile page$/ do
  visit edit_user_path(User.find_by_email("alice@columbia.edu"))  # Assumes the user is alice@columbia.edu and the route for the edit profile page is edit_user_path
end

# ... and so on for the other steps and scenarios.



  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1) < page.body.index(e2))
  end