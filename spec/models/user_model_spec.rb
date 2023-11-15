require 'rails_helper'

RSpec.describe User, type: :model do
  # Create a sample user for testing
  let(:sample_user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

  describe 'associations' do
    it 'can create user_events' do
      expect { sample_user.user_events.create(event_id: 1) }.not_to raise_error
    end

    it 'can create a profile' do
      expect { sample_user.create_profile(first_name: 'John', last_name: 'Doe') }.not_to raise_error
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(sample_user).to be_valid
    end

    it 'is not valid without a username' do
      sample_user.username = nil
      expect(sample_user).not_to be_valid
    end

    it 'is not valid without an email' do
      sample_user.email = nil
      expect(sample_user).not_to be_valid
    end

    it 'is not valid with an invalid email format' do
      sample_user.email = 'invalid_email'
      expect(sample_user).not_to be_valid
    end
  end

  
end
