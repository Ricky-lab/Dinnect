# spec/requests/sessions_spec.rb
require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    context 'with valid credentials' do
    end

    context 'with invalid credentials' do
      it 'does not log in the user' do
        post "/login", params: { session: { username_or_email: '', password: '' } }
        expect(session[:user_id]).to be_nil
      end

      it 're-renders the login page' do
        post "/login", params: { session: { username_or_email: '', password: '' } }
        expect(response).to render_template(:new)
      end
    end

    context 'with valid credentials' do
      it 'logs in the user' do
        post "/login", params: { session: { username_or_email: user.username, password: 'password' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(user_path(user))
      end
  end

  describe "DELETE /logout" do
    it 'logs out the user' do
      delete "/logout"
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to the login page' do
      delete "/logout"
      expect(response).to redirect_to(root_url)
    end
  end
end
end