require 'rails_helper'

RSpec.describe "index.html.erb", type: :view do

  it "displays 'All Events' heading" do
    render
    expect(rendered).to include("All Events")
  end


  it "displays a link to 'My Profile' when a user is logged in" do

    user = User.new(id: 1)
    assign(:current_user, user)

    render

    expect(rendered).to include(link_to('My Profile', user_path(user)))
  end

  it "does not display 'My Profile' link when no user is logged in" do

    render
    expect(rendered).not_to include(link_to('My Profile', user_path(anything)))
  end
end
