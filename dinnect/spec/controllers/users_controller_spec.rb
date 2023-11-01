# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#   describe 'GET #new' do
#     it 'renders the new template' do
#       get :new
#       expect(response).to render_template :new
#     end

#     it 'assigns a new User to @user' do
#       get :new
#       expect(assigns(:user)).to be_a_new(User)
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid attributes' do
#       it 'creates a new user' do
#         expect {
#           post :create, params: { user: { username: 'testuser', email: 'test@example.com', password: 'password' } }
#         }.to change(User, :count).by(1)
#       end

#       it 'redirects to login path' do
#         post :create, params: { user: { username: 'testuser', email: 'test@example.com', password: 'password' } }
#         expect(response).to redirect_to(login_path)
#         expect(flash[:notice]).to eq('Registration successful!')
#       end
#     end

#     context 'with invalid attributes' do
#       it 'does not create a new user' do
#         expect {
#           post :create, params: { user: { username: 'testuser', email: 'test@example.com', password: nil } }
#         }.not_to change(User, :count)
#       end

#       it 're-renders the new template' do
#         post :create, params: { user: { username: 'testuser', email: 'test@example.com', password: nil } }
#         expect(response).to render_template :new
#       end
#     end
#   end

#   describe 'GET #show' do
#     let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

#     it 'assigns the requested user to @user' do
#       get :show, params: { id: user.id }
#       expect(assigns(:user)).to eq(user)
#     end

#     it 'renders the show template' do
#       get :show, params: { id: user.id }
#       expect(response).to render_template :show
#     end
#   end
# end
