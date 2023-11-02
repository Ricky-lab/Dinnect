# Project: Dinnect 
## Group members:
- Yuehui Ruan
- Ruoxing Liao
- Yifei Luo
- Jianghao Wu
<br>

## Minimal Viable Prototype

The URL of Dinnect: https://blooming-mesa-33682-02a98668ba0d.herokuapp.com/

## Techs and Framework

!! IMPORTANT: make sure your configuations in `gemfile` are correct before developing the project:
- Ruby `3.0.6` <br>
- Ruby on Rails `7.1.1`
  ```
  sudo gem install rails -v 7.1.1
  ```
  then restart the terminal and input
  `rails -v` if saying `7.1.1`, you are good to go.
  <br>

- Installed Gem package:<br>
  None (all included in gemfile)
   <br>


## Set up:
- Once you clone the project of your native env, double check the techs and framework version that you are using
- Make sure you have your `bundle` update to the latest version. Using: `gem update bundler` 
- run `bundle update` until you get the return without errors
- Then you can set up to the local server to test, eg:

  ```
  rails server -p 4001
  ```
Then go to `localhost:4001`. 

## Testing: Cucumber

- Before you use `Cucumber` to do the unit test, do `migrate` on the test db in command line:

  ```bash
  RAILS_ENV=test rails db:migrate
  ```

+ Use `Cucumber` to do `BDD` in command line:

  ```bash
  rake cucumber
  ```

+ Pass cucumber with good coverage: 44 / 48 LOC (91.67%)

+ Design
  + Common registration and login processes 
  + Exceptional cases, such as attempts to register with already existing emails or usernames and login attempts with incorrect credentials

## Testing: RSpec

+ Use `RSpec` to do the `TDD` in command line:

  ```bash
  bundle exec rspec
  ```

+ All files are in `'./spec'`
+ Pass cucumber with good coverage: 46 / 48 LOC (95.83%)
+ Design
  + Align with the Model-View-Controller (MVC) pattern
  + **Model Tests (`user_model_spec.rb`)**: These tests validate the core business logic encapsulated within the models. They ensure that a `User` is only considered valid when all necessary attributes are present and correctly formatted, particularly focusing on the username, email, and password. The negative cases also ensure that appropriate validations are triggered when invalid data is provided, reinforcing the integrity of user data within the system.
  + **Controller Tests (`sessions_controller_spec.rb` and `users_controller_spec.rb`)**: Controller tests scrutinize the application's HTTP endpoints for both session handling (login and logout) and user management (signup and profile viewing). They carefully examine the behavior of the application when presented with both valid and invalid form submissions. The tests encompass scenarios of successful logins, correctly handling logouts, and ensuring proper user creation upon signup with validation feedback when incorrect data is submitted.
  + **Request Tests (`sessions_spec.rb` and `users_spec.rb`)**: Request tests simulate real HTTP requests to the application, providing an end-to-end check that involves routing, controllers, models, and views. These tests emulate user interaction with the login and signup pages, ensuring that the application responds with the correct HTTP status codes and renders the expected pages upon these requests.
  + **Helper Tests (`sessions_helper_spec.rb`)**: The tests for helpers validate utility functions that manage user sessions. They ensure that methods such as `log_in`, `current_user`, and `logged_in?` behave as expected, confirming that the login state is preserved across the application and that the current user is correctly identified throughout the session's lifecycle.

## Deployment

+ We deploy our app in `Heroku` with the following commands:

  ```bash
  git pull
  heroku login -i
  git checkout master
  heroku create
  heroku stack:set heroku-20
  heroku addons:create heroku-postgresql
  git push heroku master
  heroku run rake db:migrate
  ```

## Current sprint:

### Sprint 1: Oct 27, 2023
#### Front:
1.  <del> Login UI interface </del>
2. <del>Resigter interface</del>
3. <del>Intergration with db</del>

#### Back: 
1. <del>Populating db</del>
2. <del>db deployment</del>
3. <del>MVC testing</del>

#### User story

+ <del>Cucumber</del>

#### Test unit setting
- <del>RSpec</del>
