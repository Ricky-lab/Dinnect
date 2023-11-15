# In spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  # Setup for tests
  let(:event) { Event.new(title: 'Sample Event', start_time: Time.now, location_coordinates: '123.456, -123.456') }

  # Test for associations
  describe 'Associations' do
    it 'has many user_events' do
      expect(Event.reflect_on_association(:user_events).macro).to eq(:has_many)
    end

    it 'has many users through user_events' do
      expect(Event.reflect_on_association(:users).macro).to eq(:has_many)
      expect(Event.reflect_on_association(:users).options[:through]).to eq(:user_events)
    end
  end

  # Test for validations
  describe 'Validations' do
    it 'is valid with a title, start_time, and location_coordinates' do
      expect(event).to be_valid
    end

    it 'is invalid without a title' do
      event.title = nil
      expect(event).not_to be_valid
    end

    it 'is invalid without a start_time' do
      event.start_time = nil
      expect(event).not_to be_valid
    end

    it 'is invalid without location_coordinates' do
      event.location_coordinates = nil
      expect(event).not_to be_valid
    end
  end

  # Test for enum status
  describe 'Enum status' do
    it 'defines the correct enum values for status' do
      expect(Event.statuses.keys).to match_array(['active', 'full', 'completed', 'cancelled'])
    end
  end
end
