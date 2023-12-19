# spec/models/user_event_spec.rb
require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:event) { Event.create(title: 'Sample Event', start_time: Time.now, location_coordinates: '123.456, 789.012') }

  describe 'associations' do
    it 'belongs to a user' do
      user_event = UserEvent.new(user: user, event: event, role: 'holder')
      expect(user_event.user).to eq(user)
    end

    it 'belongs to an event' do
      user_event = UserEvent.new(user: user, event: event, role: 'holder')
      expect(user_event.event).to eq(event)
    end
  end

  describe 'validations' do
    before do
      UserEvent.create(user: user, event: event, role: 'holder')
    end

    it 'does not allow the same user to be added to the same event twice' do
      duplicate_user_event = UserEvent.new(user: user, event: event, role: 'holder')
      expect(duplicate_user_event.valid?).to be_falsey
    end
  end
end
