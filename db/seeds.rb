# Create Users

# UserEvent.delete_all # or UserEvent.destroy_all if callbacks are needed
# Event.delete_all # or Event.destroy_all if callbacks are needed


test_password = BCrypt::Password.create('123123')
10.times do |i|
  username = "user#{i}"
  email = "user#{i}@email.com"

  User.find_or_create_by!(username: username, email: email) do |user|
    user.password_digest = test_password
  end
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


# Array of coordinates for different locations within New York City
ny_locations = [
  { name: "Times Square", coordinates: "40.7580, -73.9855" },
  { name: "Lower Manhattan", coordinates: "40.7128, -74.0060" },
  { name: "Washington Square Park", coordinates: "40.7308, -73.9973" },
  { name: "Empire State Building", coordinates: "40.7484, -73.9857" },
  { name: "Central Park", coordinates: "40.7829, -73.9654" },
  { name: "Wall Street", coordinates: "40.7061, -74.0092" },
  { name: "Chelsea Market", coordinates: "40.7480, -74.0048" },
  { name: "Roosevelt Island", coordinates: "40.7489, -73.9680" },
  { name: "Madison Square Park", coordinates: "40.7411, -73.9897" },
  { name: "Long Island City", coordinates: "40.7306, -73.9352" }
]

# Track which users are already holders to prevent them from being participants in the same event


holders = []
users = User.all.to_a

5.times do |i|
  location = ny_locations[i % ny_locations.length]
  event = Event.create!(
    title: "Event #{i}",
    description: "Description for event #{i}.",
    start_time: Time.now + (i*2).hours,
    duration: 2,
    location_name: location[:name],
    location_coordinates: location[:coordinates],
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
