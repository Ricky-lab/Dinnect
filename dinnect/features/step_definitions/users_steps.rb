
Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        email = user['email']
        username = user['username']
        password = user['password']
        password_digest = BCrypt::Password.create(password)
        # Create users in your system using the provided attributes
        # Example:
        User.create!( username: username,email: email, password_digest: password_digest)
    end
  end
  
  Then("I should be logged out") do
    # You can test if the user is not logged in by checking elements visible to logged-in users.
    # For example, check if the 'Log Out' link/button is not present on the homepage.
    expect(page).to_not have_content("logout")
  end

  Then /I should see the error message "(.*)"/ do |e1|
    expect(page).to have_content(e1)#'Invalid Email Address or Username!'
  end

  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1) < page.body.index(e2))
  end
  
  When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    rating_list.split(', ').each do |rating|
      step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
    end
  end
  
  Then /I should see all the movies/ do
    # Make sure that all the movies in the app are visible in the table
    Movie.all.each do |movie|
      step %{I should see "#{movie.title}"}
    end
  end
  
  Then /^the director of "(.+)" should be "(.+)"/ do |title, director|
    movie = Movie.find_by_title(title)
    visit movie_path(movie)
    expect(page.body).to match(/Director: #{director}/)
  end