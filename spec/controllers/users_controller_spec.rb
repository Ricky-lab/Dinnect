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
        expect(flash[:notice]).to eq('Registration successful! Please log in.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new User' do
        expect {
          post signup_path, params: { user: invalid_attributes }
        }.to_not change(User, :count)
      end

      it 're-renders the signup template' do
        post signup_path, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create! valid_attributes }

    before do
      # 模拟用户登录
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:id' do
    context 'when the user is not logged in' do
      let(:user) { User.create!(valid_attributes) }
  
      it 'redirects to the login page' do
        get user_path(user)
        expect(response).to redirect_to(login_path)
      end
    end
  
    context 'when accessing a different user' do
      let(:user) { User.create!(valid_attributes) }
      let(:other_user) { User.create!(username: 'otheruser', email: 'other@example.com', password: 'password') }
  
      before do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
      end
  
      it 'redirects to the root path' do
        get user_path(other_user)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET /users/:id/my_events' do
    let(:user) { User.create!(valid_attributes) }
  
    before do
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end
  
    it 'renders the my_events template' do
      get my_events_user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:my_events)
    end
  end

  

  describe 'GET /users/:id/my_events' do
    context 'when not logged in' do
      let(:user) { User.create!(valid_attributes) }
  
      it 'redirects to the login page' do
        get my_events_user_path(user)
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET /users/:id' do
    context 'when accessing a different user' do
      let(:user) { User.create!(valid_attributes) }
      let(:other_user) { User.create!(username: 'otheruser', email: 'other@example.com', password: 'password') }
  
      before do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
      end
  
      it 'redirects due to lack of permissions' do
        get user_path(other_user)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET /users/:id/my_events' do
    context 'when user has no events' do
      let(:user) { User.create!(valid_attributes) }
  
      before do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
      end
  
      it 'renders the my_events template' do
        get my_events_user_path(user)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:my_events)
      end
    end
  end

  describe 'GET /users/:id' do
    context 'when the user does not exist' do
      it 'redirects to the login page' do
        get user_path(id: 'nonexistent')
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'GET /users/:id/my_events' do
    context 'when logged in' do
      let(:user) { User.create!(valid_attributes) }
  
      before do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
        get my_events_user_path(user)
      end
  
      it 'allows access to my_events' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /users/:id/my_events' do
    context 'when user has events' do
      let(:user) { User.create!(valid_attributes) }
      # 创建一些测试用的活动和用户活动关联
  
      before do
        post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
        get my_events_user_path(user)
      end
  
      it 'shows the user events' do
        # 测试页面上显示的活动是否正确
      end
    end
  end
  
end
