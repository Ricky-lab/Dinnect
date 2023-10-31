# Specs in this file have access to a helper object that includes

require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper  do
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  describe '#log_in' do
    it 'logs in the user' do
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe '#current_user' do  
    it 'returns the current user if logged in' do
      log_in(user)
      expect(helper.current_user).to eq(user)
    end

    it 'returns nil if user is not logged in' do
      expect(helper.current_user).to be_nil
    end
  end

  describe '#logged_in?' do
    it 'returns true if a user is logged in' do
      helper.log_in(user)
      expect(helper.logged_in?).to be true
    end

    it 'returns false if a user is not logged in' do
      expect(helper.logged_in?).to be false
    end
  end
end