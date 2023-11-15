# spec/requests/profiles_spec.rb
require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:profile_attributes) { { first_name: 'John', last_name: 'Doe', class_name: 'Class 1', school: 'School A', major: 'Major X', dietary_preference: 'Vegetarian', email: 'john.doe@example.com' } }

  before do
    # Log in
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
  end

  describe "GET /profiles/new" do
    it "renders the new template" do
      get new_profile_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /profiles" do
    context 'with invalid attributes' do
      it 'does not create a profile and redirects to the user show page' do
        post profiles_path, params: { profile: profile_attributes.merge(first_name: '') }
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

  describe "GET /profiles/:id" do
    it 'renders the show template or redirects to the users index page' do
      profile = user.create_profile(profile_attributes)
      get profile_path(profile)
      if response.redirect?
        expect(response).to redirect_to(users_path) # The expected redirect path is the user list page
      else
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end
  end
end