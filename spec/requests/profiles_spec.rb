# spec/requests/profiles_spec.rb
require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }

  before do
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
  end

  describe 'GET /profiles/:id' do
    it 'renders the show template' do
      get profile_path(user.profile)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'PUT /profiles/:id' do
    let(:updated_attributes) {
      { email: 'newemail@example.com' }
    }

    it 'updates the profile and redirects to the user page' do
      put profile_path(user.profile), params: { profile: updated_attributes }
      expect(response).to redirect_to(user_path(user))
      expect(user.profile.reload.email).to eq('test@example.com')
    end
  end
end
