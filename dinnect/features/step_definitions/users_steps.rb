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

When /^I fill in the following:$/ do |table|
  table.hashes.each do |row|
    fill_in row["Field"], with: row["Value"]
  end
end

Then /I should be logged out/ do
  expect(page).to_not have_content("logout")
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1) < page.body.index(e2))
end
