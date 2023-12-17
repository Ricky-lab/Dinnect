require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:valid_attributes) {
    {
      title: 'Sample Event',
      description: 'This is a test event',
      start_time: Time.now,
      duration: 60,
      location_name: 'Test Location',
      location_coordinates: '123,456',
      status: 'active'
    }
  }
  let(:invalid_attributes) {
    {
      title: '',
      description: '',
      start_time: nil,
      duration: nil,
      location_name: '',
      location_coordinates: '',
      status: 'active'
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
      it 'creates a new event' do
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

  describe 'POST /events/:id/join' do
    let!(:event) { Event.create!(valid_attributes) }
  
    it 'allows a user to join the event' do
      expect {
        post join_event_path(event)
      }.to change(UserEvent, :count).by(1)
      expect(response).to redirect_to(event_path(event))
    end
  end
  
  describe 'DELETE /events/:id/leave' do
    let!(:event) { Event.create!(valid_attributes) }
    let!(:user_event) { UserEvent.create!(user: user, event: event, role: 'participator') }
  
    it 'allows a user to leave the event' do
      expect {
        delete leave_event_path(event)
      }.to change(UserEvent, :count).by(-1)
      expect(response).to redirect_to(event_path(event))
    end
  end
  
  describe 'PATCH /events/:id/cancel' do
    let!(:event) { Event.create!(valid_attributes) }
    let!(:user_event) { UserEvent.create!(user: user, event: event, role: 'holder') }
  
    it 'allows the event creator to cancel the event' do
      session[:user_id] = user.id  
      patch cancel_event_path(event)
      event.reload
      expect(event.status).to eq('cancelled')
      expect(response).to redirect_to(event_path(event))
    end
  end

  # 测试 PUT /events/:id
describe 'PUT /events/:id' do
    let!(:event) { Event.create!(valid_attributes) }
    let(:updated_attributes) { { title: 'Updated Title' } }
  
    it 'updates the event' do
      session[:user_id] = user.id
      put event_path(event), params: { event: updated_attributes }
      event.reload
      expect(event.title).to eq('Updated Title')
    end
  end
  
  describe 'DELETE /events/:id/remove_participant/:user_id' do
    let!(:event) { Event.create!(valid_attributes) }
    let!(:participant) { User.create!(username: 'participant', email: 'participant@example.com', password: 'password') }
    let!(:user_event_holder) { UserEvent.create!(user: user, event: event, role: 'holder') }
    let!(:user_event_participator) { UserEvent.create!(user: participant, event: event, role: 'participator') }
  
    it 'removes a participant from the event' do
      session[:user_id] = user.id  
      expect {
        delete remove_participant_event_path(event, participant.id)
      }.to change(UserEvent, :count).by(-1)
      expect(response).to redirect_to(event_path(event))
    end
  end

  describe 'POST /events/:id/join when not logged in' do
    let!(:event) { Event.create!(valid_attributes) }
  
    it 'redirects to the login page' do
      post join_event_path(event)
      expect(response).to redirect_to(event_path(event))
    end
  end
  

  describe 'GET /events/new' do
    it 'renders the new event template' do
      get new_event_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /events/:id/edit' do
    let!(:event) { Event.create!(valid_attributes) }
  
    it 'renders the edit event template' do
      get edit_event_path(event)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE /events/:id/remove_participant/:user_id when the current user is not the event holder' do
    let!(:event) { Event.create!(valid_attributes) }
    let!(:participant) { User.create!(username: 'participant', email: 'participant@example.com', password: 'password') }
    let!(:other_user) { User.create!(username: 'otheruser', email: 'other@example.com', password: 'password') }
  
    it 'does not remove the participant and redirects' do
      session[:user_id] = other_user.id
      delete remove_participant_event_path(event, participant.id)
      expect(response).to redirect_to(event_path(event)) # assuming redirect to event page if not authorized
    end
  end 

end
