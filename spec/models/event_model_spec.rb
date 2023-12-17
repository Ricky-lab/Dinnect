# spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with a title, start_time, and location_coordinates' do
    event = Event.new(title: 'Sample Event', start_time: Time.now, location_coordinates: '123.456, 789.012')
    expect(event).to be_valid
  end

  it 'is invalid without a title' do
    event = Event.new(title: nil, start_time: Time.now, location_coordinates: '123.456, 789.012')
    expect(event).not_to be_valid
  end

  it 'is invalid without a start_time' do
    event = Event.new(title: 'Sample Event', start_time: nil, location_coordinates: '123.456, 789.012')
    expect(event).not_to be_valid
  end

  it 'is invalid without location_coordinates' do
    event = Event.new(title: 'Sample Event', start_time: Time.now, location_coordinates: nil)
    expect(event).not_to be_valid
  end
end
