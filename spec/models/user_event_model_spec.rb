# In spec/models/user_event_spec.rb
require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  # Setup for tests
  let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  let(:event) { Event.create(title: 'Sample Event', start_time: Time.now, location_coordinates: '123.456, -123.456') }
  let(:user_event) { UserEvent.create(user: user, event: event) }

  # Test for associations
  describe 'Associations' do
    it 'belongs to user' do
      expect(user_event.user).to eq(user)
    end

    it 'belongs to event' do
      expect(user_event.event).to eq(event)
    end
  end

  # Test for enum role
  describe 'Enum role' do
    it 'defines the correct enum values for role' do
      expect(UserEvent.roles.keys).to match_array(['holder', 'participator'])
    end
  end

  # Test for uniqueness validation
  describe 'Validations' do
    context 'validates uniqueness of user_id scoped to event_id' do
      before do
        # Creating an existing UserEvent
        UserEvent.create(user: user, event: event)
      end

      it 'is invalid when creating a duplicate UserEvent' do
        duplicate_user_event = UserEvent.new(user: user, event: event)
        expect(duplicate_user_event).not_to be_valid
      end
    end
  end
end
