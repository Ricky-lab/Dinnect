require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    # Prepare any instance variables expected by the view
    assign(:events, [
      Event.new(id: 1, title: "Event 1", description: "Description for event 1"),
      Event.new(id: 2, title: "Event 2", description: "Description for event 2")
    ])
    # Stub `current_user` helper method within your view tests
    allow(view).to receive(:current_user).and_return(User.new(id: 1))
  end

  it "displays 'All Events' heading" do
    render
    expect(rendered).to include("All Events")
  end

  it "displays a link to 'My Profile' when a user is logged in" do
    render
    expect(rendered).to include('My Profile')
  end

end