# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) {
    { username: 'newuser', email: 'newuser@example.com', password: 'password' }
  }
  let(:invalid_attributes) {
    { username: '', email: 'bademail', password: '' }
  }

  describe 'GET /signup' do
    it 'renders the signup template' do
      get signup_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /signup' do
    context 'with valid params' do
      it 'creates a new User and redirects to the login page' do
        expect {
          post signup_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(login_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new User and re-renders the signup template' do
        expect {
          post signup_path, params: { user: invalid_attributes }
        }.to_not change(User, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create!(valid_attributes) }

    before do
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end

    it 'returns http success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:id/my_events' do
    let(:user) { User.create!(valid_attributes) }

    before do
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end

    it 'returns http success' do
      get my_events_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
