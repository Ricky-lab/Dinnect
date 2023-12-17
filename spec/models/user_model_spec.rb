# In spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a username, email, and password' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without a password' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid with invalid email' do
    user = User.new(username: 'testuser', email: 'test', password: 'password')
    expect(user).not_to be_valid
  end

  it 'is invalid without a username' do
    user = User.new(username: nil, email: 'test@example.com', password: 'password')
    expect(user).not_to be_valid
  end
  
  it 'is invalid without an email' do
    user = User.new(username: 'testuser', email: nil, password: 'password')
    expect(user).not_to be_valid
  end
  
  it 'is invalid with a duplicate username' do
    User.create(username: 'testuser', email: 'test@example.com', password: 'password')
    user = User.new(username: 'testuser', email: 'test2@example.com', password: 'password')
    expect(user).not_to be_valid
  end
  
  it 'is invalid with a duplicate email' do
    User.create(username: 'testuser', email: 'test@example.com', password: 'password')
    user = User.new(username: 'testuser2', email: 'test@example.com', password: 'password')
    expect(user).not_to be_valid
  end
end


