# In spec/models/profile_spec.rb
require 'rails_helper'

RSpec.describe Profile, type: :model do
  # Setup for tests
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:profile) { Profile.create(user: user) }

  # Test for association with User model
  describe 'Associations' do
    it 'belongs to a user' do
      expect(profile.user).to eq(user)
    end
  end

  # Test for update_email before_save callback
  describe 'Callbacks' do
    it 'updates the email before saving' do
      user.update(email: 'updated@example.com')
      profile.save
      expect(profile.email).to eq('updated@example.com')
    end
  end

  # Additional tests for Profile model can be added here
end
