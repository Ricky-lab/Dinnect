require 'rails_helper'

RSpec.describe 'users/my_events', type: :view do
  before do
    @user = assign(:user, User.create!(
      username: 'Username',
      email: 'user@example.com',
      password: 'password'
    ))
    
    event1 = Event.create!(title: 'Event 1', start_time: Time.now, location_coordinates: 'Coordinates')
    event2 = Event.create!(title: 'Event 2', start_time: Time.now, location_coordinates: 'Coordinates')

    @holder_events = [
      UserEvent.create!(user: @user, event: event1, role: 'holder'),
      UserEvent.create!(user: @user, event: event2, role: 'holder')
    ]

    @participator_events = [
      UserEvent.create!(user: @user, event: event1, role: 'participator'),
      UserEvent.create!(user: @user, event: event2, role: 'participator')
    ]
  end
end
