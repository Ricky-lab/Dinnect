require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe 'GET #new' do
    it 'renders the new template' do
      get login_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do

    context 'with valid credentials' do
      it 'logs in by existing username' do
        user = User.create(username: 'test1', email: 'test1@example.com', password: 'password')
        post login_path, params: { session: { username_or_email: 'test1', password: 'password' } }
        expect(response).to redirect_to(user_path(user))
      end

      it 'logs in by existing email' do
        user = User.create(username: 'test2', email: 'test2@example.com', password: 'password')
        post login_path, params: { session: { username_or_email: 'test2@example.com', password: 'password' } }
        expect(response).to redirect_to(user_path(user))
      end

      it 'logs in by username after valid register' do
        user = User.create(username: 'test_1', email: 'test_1@example.com', password: 'password')
        post login_path, params: { session: { username_or_email: 'test_1', password: 'password' } }
        expect(response).to redirect_to(user_path(user))
      end

      it 'logs in by email after valid register' do
        user = User.create(username: 'test_2', email: 'test_2@example.com', password: 'password')
        post login_path, params: { session: { username_or_email: 'test_2@example.com', password: 'password' } }
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid credentials' do

      it 'does not log with correct username but wrong password' do
        post login_path, params: { session: { username_or_email: 'test1', password: 'wrongpassword' } }
        expect(response).to render_template(:new)
      end

      it 'does not log in with invalid username' do
        post login_path, params: { session: { username_or_email: 'test3', password: 'password' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

    it 'logs out the user' do
      delete logout_path
      expect(response).to redirect_to(root_url)
    end
  end
end