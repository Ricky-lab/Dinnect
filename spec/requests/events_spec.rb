RSpec.describe "Events", type: :request do
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }

  describe "GET /index" do
    before do
      # Log in the user
      post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
    end

    it "returns http success" do
      get "/events/index"
      expect(response).to have_http_status(:success)
    end

    it "displays link to user's profile" do
      get "/events/index"
      expect(response.body).to include(user_path(user))
    end
  end
end
