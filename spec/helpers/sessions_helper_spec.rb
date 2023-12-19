# require 'rails_helper'

# RSpec.describe SessionsHelper, type: :helper do
#   let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

#   describe '#log_in' do
#     before { log_in(user) }

#     it 'logs in the user' do
#       expect(session[:user_id]).to eq(user.id)
#     end
#   end

#   describe '#current_user' do  
#     context 'when user is logged in' do
#       before { log_in(user) }

#       it 'returns the current user' do
#         expect(current_user).to eq(user)
#       end
#     end

#     context 'when user is not logged in' do
#       it 'returns nil' do
#         expect(current_user).to be_nil
#       end
#     end
#   end

#   describe '#logged_in?' do
#     context 'when user is logged in' do
#       before { log_in(user) }

#       it 'returns true' do
#         expect(logged_in?).to be true
#       end
#     end

#     context 'when user is not logged in' do
#       it 'returns false' do
#         expect(logged_in?).to be false
#       end
#     end
#   end
# end
