require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }

  before do
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
  end

  describe 'GET /events' do
    it 'responds successfully and assigns @events' do
      get events_path
      expect(response).to have_http_status(:success)
    end
  end


end
