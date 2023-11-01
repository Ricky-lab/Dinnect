# spec/requests/sessions_request_spec.rb
require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe 'GET #new' do
    it 'renders the new template' do
      get login_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

    
    context 'with invalid credentials' do
      it 'does not log in the user' do
        post login_path, params: { session: { username_or_email: '', password: '' } }
        expect(response).to render_template(:new)
      end

      it 're-renders the new template' do
        post login_path, params: { session: { username_or_email: '', password: '' } }
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

    it 'redirects to the login page' do
      delete logout_path
      expect(response).to redirect_to(root_url)
    end
  end
end
