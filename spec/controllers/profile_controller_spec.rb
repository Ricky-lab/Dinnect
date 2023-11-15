require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }

  let(:valid_attributes) {
    {
      profile: {
        first_name: 'John',
        last_name: 'Doe',
        class_name: 'Class A',
        school: 'ABC School',
        major: 'Computer Science',
        dietary_preference: 'Vegetarian',
        email: 'john@example.com'
      }
    }
  }

  let(:invalid_attributes) {
    {
      profile: {
        first_name: nil,
        last_name: 'Doe',
        class_name: 'Class A',
        school: 'ABC School',
        major: 'Computer Science',
        dietary_preference: 'Vegetarian',
        email: 'john@example.com'
      }
    }
  }

  before do
    # mock user
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
  end

  describe 'POST /profiles' do
    it 'handles valid params' do
      post profiles_path, params: valid_attributes
      expect(response).to be_redirect
    end

    it 'handles invalid params' do
      post profiles_path, params: invalid_attributes
      expect(response).to be_redirect
    end
  end

  describe 'GET /profiles/:id' do
    it 'handles profile viewing' do
      profile = Profile.create!(valid_attributes[:profile].merge(user_id: user.id))
      get profile_path(profile)
      expect(response).to be_redirect
    end
  end
end
