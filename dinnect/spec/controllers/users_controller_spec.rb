# spec/requests/users_request_spec.rb
require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) { { username: 'testuser', email: 'test@example.com', password: 'password' } }
  let(:invalid_attributes) { { username: nil, email: 'test@example.com', password: 'password' } }

  describe 'GET /signup' do
    it 'renders the signup template' do
      get signup_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /signup' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post signup_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the login path with a notice' do
        post signup_path, params: { user: valid_attributes }
        expect(response).to redirect_to(login_path)
        follow_redirect!
        expect(flash[:notice]).to eq('Registration successful!')
      end
    end

    context 'with invalid params' do
      it 'does not create a new User' do
        expect {
          post signup_path, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it 're-renders the signup template' do
        post signup_path, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /users/:id' do
    it 'renders the show template' do
      user = User.create! valid_attributes
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
