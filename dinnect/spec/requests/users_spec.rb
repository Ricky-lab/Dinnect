# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) { { username: 'testuser', email: 'test@example.com', password: 'password' } }
  let(:invalid_attributes) { { username: '', email: '', password: '' } }
  let(:user) { User.create(valid_attributes) }

  describe "GET /signup" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST /signup" do
    context 'with valid attributes' do
      it 'creates a new user' do
        post signup_path, params: { user: valid_attributes }
        expect(response).to redirect_to(login_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user' do
        post signup_path, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /users/:id" do
    it 'returns http success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end
end
