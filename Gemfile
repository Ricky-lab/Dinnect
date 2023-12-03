source 'https://rubygems.org'

ruby '3.0.6'
gem 'rails', '7.1.1'

# Use PostgreSQL as your production database
group :production do
  # we don't need pq, we are using sqlite3
  # gem 'pg'
  gem 'sqlite3', '~> 1.4'
  gem 'pg', '~> 1.1' # for Heroku deployment
  gem 'rails_12factor'
end

# Use SQLite for development and test environments
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.8'
  gem 'capybara', '~> 3.36'
  gem 'launchy', '~> 2.5'
  gem 'rspec-rails', '~> 5.0'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
end

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '~> 4.2'
gem 'jquery-rails'
gem 'actioncable', '7.1.1'

gem 'activerecord'

# implementing user authentication and registration in Ruby on Rails application
# gem 'devise', '>= 4.9.3'  # Replace with the compatible version

gem 'bcrypt' 

gem 'rails-controller-testing'

gem 'bootstrap', '~> 5.1.3'

gem 'will_paginate', '~> 3.3.0'

gem 'dotenv-rails', groups: [:development, :test]

