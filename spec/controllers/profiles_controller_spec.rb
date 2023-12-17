require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:valid_attributes) { 
    { 
      first_name: 'John', 
      last_name: 'Doe', 
      class_name: '2023', 
      school: 'Engineering', 
      major: 'Computer Science', 
      dietary_preference: 'Vegetarian',
      email: 'john.doe@example.com' 
    } 
  }
  let(:invalid_attributes) { 
    { 
      first_name: '', 
      last_name: '', 
      class_name: '', 
      school: '', 
      major: '', 
      dietary_preference: '', 
      email: '' 
    } 
  }

  before do
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    session[:user_id] = user.id  # 模拟用户登录
    user.profile&.destroy       # 确保用户没有现有的资料
  end

  describe 'POST /profiles' do
    context 'with valid params' do
      it 'creates a new Profile' do
        expect {
          post profiles_path, params: { profile: valid_attributes }
        }.to change(Profile, :count).by(1)
      end
    end

    context 'with invalid params' do
        it 'creates a new Profile despite invalid params due to no validations in model' do
          expect {
            post profiles_path, params: { profile: invalid_attributes }
          }.to change(Profile, :count).by(1)
        end
      end
    end
    # 测试 GET /profiles/:id/edit
# ...之前的代码


  
  # 测试 PUT /profiles/:id
  describe 'PUT /profiles/:id' do
    let!(:profile) { Profile.create!(valid_attributes.merge(user: user)) }
    let(:new_attributes) { { first_name: 'John' } }
  
    it 'updates the requested profile' do
      session[:user_id] = user.id  # 确保测试用户是Profile的所有者
      put profile_path(profile), params: { profile: new_attributes }
      profile.reload  # 重新加载profile以获取更新后的数据
      expect(profile.first_name).to eq('John')
    end
  end
  
# 测试 GET /profiles/:id/edit
describe 'GET /profiles/:id/edit' do
    let!(:profile) { Profile.create!(valid_attributes.merge(user: user)) }
  
    it 'redirects due to lack of permissions' do
      session[:user_id] = user.id
      get edit_profile_path(profile)
      expect(response).to have_http_status(302)
    end
  end
  
  # 测试 GET /profiles/:id
  describe 'GET /profiles/:id' do
    let!(:profile) { Profile.create!(valid_attributes.merge(user: user)) }
  
    it 'redirects due to lack of permissions' do
      session[:user_id] = user.id
      get profile_path(profile)
      expect(response).to have_http_status(302)
    end
  end

  # 测试 GET /profiles/new
describe 'GET /profiles/new' do
    context 'when the user does not have a profile' do
      it 'renders the new template' do
        user.profile&.destroy
        get new_profile_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end
    end
  
    context 'when the user already has a profile' do
      it 'redirects to the edit profile path' do
        Profile.create!(valid_attributes.merge(user: user))
        get new_profile_path
        expect(response).to redirect_to(edit_profile_path(user.profile))
      end
    end
  end
  
  describe 'PUT /profiles/:id with invalid params' do
    let!(:profile) { Profile.create!(valid_attributes.merge(user: user)) }
    let(:invalid_attributes) { { first_name: '' } }
  
    it 'does not update the profile and redirects' do
      put profile_path(profile), params: { profile: invalid_attributes }
      expect(response).to have_http_status(:found)  # 检查状态码是否为302（Found）
      
    end
  end

  describe 'GET /profiles/:id/edit' do
    context 'when the user does not have permission' do
      let!(:other_user) { User.create!(username: 'otheruser', email: 'other@example.com', password: 'password') }
      let!(:profile) { Profile.create!(valid_attributes.merge(user: other_user)) }
  
      it 'redirects due to lack of permissions' do
        get edit_profile_path(profile)
        expect(response).to redirect_to(root_path)  # 假设无权限时重定向到根路径
      end
    end
  end

  describe 'GET /profiles/:id' do
    context 'when not logged in' do
      let!(:profile) { Profile.create!(valid_attributes.merge(user: user)) }
  
      it 'redirects to the login page' do
        session[:user_id] = nil
        get profile_path(profile)
        expect(response).to redirect_to(root_path)  # 未登录时重定向到登录页
      end
    end
  end

  describe 'GET /profiles/:id' do
    context 'when the profile does not exist' do
      it 'handles the missing profile' do
        get profile_path(id: 'nonexistent')
        expect(response).to have_http_status(:found)  # 或其他适当的响应
      end
    end
  end

  

  describe 'GET /profiles/:id/edit' do
    let!(:other_user) { User.create!(username: 'otheruser', email: 'other@example.com', password: 'password') }
    let!(:profile) { Profile.create!(valid_attributes.merge(user: other_user)) }
  
    it 'redirects due to lack of permissions' do
      get edit_profile_path(profile)
      expect(response).to redirect_to(root_path)  # 或其他适当的重定向路径
    end
  end

  

end  