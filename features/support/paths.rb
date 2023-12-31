# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the Registration page$/ then signup_path()
    when /^the Home page$/ then '/'
    when /^the Log in page$/ then login_path
    when /^the Log Out page$/ then logout_path    
    when /^the User page for "(.+)"$/ then user_path(User.find_by(username: $1)||User.find_by(email: $1)) #'/users/'+(User.find_by(username: $1).id)
    when /^the Profile page$/ then new_profile_path
    when /^the Edit Profile page for "(.+)"$/
      user = User.find_by(username: $1) || User.find_by(email: $1)
      edit_profile_path(user.profile) if user

    when /^the All Events page$/ then events_path
    when /^the My Events page for '(.+)'$/ then my_events_user_path(User.find_by(username: $1)||User.find_by(email: $1))
    when /^the New Event page$/ then new_event_path
    when /^the Edit Event page for '(.+)'$/ then edit_event_path(Event.find_by(title: $1))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
