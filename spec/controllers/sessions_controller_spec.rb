require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe 'GET #new' do
    it 'renders the new template' do
      get login_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let!(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

    context 'with valid credentials' do
      it 'logs in the user' do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
        expect(response).to redirect_to(user_path(user))
      end

    end

    context 'with invalid credentials' do
      it 'does not log in with incorrect password' do
        post login_path, params: { session: { username_or_email: user.username, password: 'wrongpassword' } }
        expect(response).to render_template(:new)
      end

      it 'does not log in with invalid username' do
        post login_path, params: { session: { username_or_email: 'invaliduser', password: 'password' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

    before do
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end

    it 'logs out the user' do
      delete logout_path
      expect(response).to redirect_to(root_url)
    end
  end
end
