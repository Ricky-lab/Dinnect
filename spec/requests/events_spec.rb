# spec/requests/events_spec.rb
require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:valid_attributes) {
    {
      title: 'Sample Event',
      start_time: Time.now,
      location_coordinates: '123.456, 789.012',
      status: 'active'
    }
  }
  let(:invalid_attributes) {
    {
      title: '',
      start_time: nil,
      location_coordinates: ''
    }
  }

  before do
    post login_path, params: { session: { username_or_email: user.username, password: 'password' } }
  end

  describe 'GET /events' do
    it 'renders the index template' do
      get events_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /events/:id' do
    let!(:event) { Event.create!(valid_attributes) }

    it 'renders the show template' do
      get event_path(event)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'POST /events' do
    context 'with valid attributes' do
      it 'creates a new event and redirects to user\'s my events page' do
        expect {
          post events_path, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
        expect(response).to redirect_to(my_events_user_path(user))
      end
    end

    context 'with invalid attributes' do
      it 'does not create an event and re-renders new template' do
        expect {
          post events_path, params: { event: invalid_attributes }
        }.to_not change(Event, :count)
        expect(response).to render_template(:new)
      end
    end
  end

end
