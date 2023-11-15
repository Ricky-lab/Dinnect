# Create Users

test_password = BCrypt::Password.create('123123')
10.times do |i|
  User.create!(
    username: "user#{i}",
    email: "user#{i}@email.com",
    password_digest: test_password#
  )
end

# Create Profiles for each User
# User.all.each do |user|
#   Profile.create!(
#     first_name: "FirstName#{user.id}",
#     last_name: "LastName#{user.id}",
#     class_name: "2024",
#     school: "SEAS",
#     major: "CS",
#     dietary_preference: "No Preference",
#     email: user.email, # Email from user
#     user_id: user.id
#   )
# end
#
# The prvious seeding function is not working because we have callback functions in user model
# After creating a new user, we will automatically create a default profile for user with NULL fields
# We use UPDATE rather than CREATE

User.all.each do |user|
  # Update the profile with additional data if necessary
  user.profile.update!(
    first_name: "FirstName#{user.username}",
    last_name: "LastName#{user.username}",
    class_name: "2024",
    school: "SEAS",
    major: "CS",
    dietary_preference: "No Preference"
    # Assuming the email is already set by the after_create callback, it is not updated here.
  )
end

# Track which users are already holders to prevent them from being participants in the same event
holders = []

users = User.all.to_a
5.times do |i|
  event = Event.create!(
    title: "Event #{i}",
    description: "Description for event #{i}.",
    start_time: Time.now + (i*2).hours,
    duration: 2,
    location_name: "Location #{i}",
    location_coordinates: "40.7128° N, 74.0060° W",
    status: "active"
  )

  # Randomly select a user as the holder for the event
  holder = users.sample
  UserEvent.create!(
    user: holder,
    event: event,
    role: "holder"
  )

  # Randomly select some users as participators, but not the holder and not for all users
  (users - [holder]).sample(rand(1..users.size-1)).each do |user|
    UserEvent.create!(
      user: user,
      event: event,
      role: "participator"
    )
  end
end

puts 'Database seeded!'
