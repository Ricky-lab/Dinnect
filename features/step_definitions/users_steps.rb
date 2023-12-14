Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        email = user['email']
        username = user['username']
        password = user['password']
        password_digest = BCrypt::Password.create(password)
        # Create users in your system using the provided attributes
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



Given('I remember the profile information') do

  @old_profile_info = {
    first_name: find_field('First name').value,
    last_name: find_field('Last name').value,
    class_name: find_field('Class name').value,
    school: find_field('School').value,
    major: find_field('Major').value,
    dietary_preference: find_field('Dietary preference').value,
    email: find_field('Email').value  # Added line
  }
end

Then('the profile information should be unchanged') do
  expect(find_field('First name').value).to eq(@old_profile_info[:first_name])
  expect(find_field('Last name').value).to eq(@old_profile_info[:last_name])
  expect(find_field('Class name').value).to eq(@old_profile_info[:class_name])
  expect(find_field('School').value).to eq(@old_profile_info[:school])
  expect(find_field('Major').value).to eq(@old_profile_info[:major])
  expect(find_field('Dietary preference').value).to eq(@old_profile_info[:dietary_preference])
  expect(find_field('Email').value).to eq(@old_profile_info[:email])  # Added line
end
