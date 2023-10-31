require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    it 'logs in a valid user and redirects to user profile' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
      post :create, params: { session: { username_or_email: 'testuser', password: 'password' } }
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(user_path(user))
    end

    it 'renders the login form for invalid credentials' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
      post :create, params: { session: { username_or_email: 'testuser', password: 'wrong_password' } }
      expect(session[:user_id]).to be_nil
      expect(response).to render_template(:new)
      expect(flash[:danger]).to eq('Invalid username/email and password combination')
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to the root URL' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_url)
    end
  end
end