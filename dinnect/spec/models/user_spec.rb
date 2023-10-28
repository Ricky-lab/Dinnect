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
end
