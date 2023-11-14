# db/seeds.rb

# You should replace the passwords with secure password hashes
password1 = BCrypt::Password.create('123123')
password2 = BCrypt::Password.create('123123')
password3 = BCrypt::Password.create('123123')

# Create users with usernames, emails, and hashed passwords
User.create(username: 'yr2453', email: 'yr2453@example.com', password_digest: password1)
User.create(username: 'admin', email: 'admin@email.com', password_digest: password2)
User.create(username: 'user2', email: 'user2@example.com', password_digest: password3)

# Add more users as needed
