# Project: [Dinnect ](https://dinnect-71eda9ef843e.herokuapp.com/login) 
## Group members:
- Yuehui Ruan
- Ruoxing Liao
- Yifei Luo
- Jianghao Wu


## User Stories: [Why Dinnect?](DINNECT_README.md)
We analyze the needs and tell you why you should believe Dinnect can be a __go-to community__ software!

<br>

## Minimal Viable Prototype: [Dinnect](https://dinnect-71eda9ef843e.herokuapp.com/login)(Iter-2)

<br>

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
- Once you clone the project of your local env, double check the techs and framework version that you are using
- Make sure you have your `bundler` update to the latest version. Using: `gem update bundler` 
- run  `bundle install` and `bundle update` until you get the return without errors
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
  bundle exec rake cucumber
  ```

+ Pass cucumber and rspec with good coverage: 174 / 182 LOC (95.6%) 

+ Design
  + Registration: 
    + Register successfully with username, email (should have @), password.
    + Register unsuccessfully if (1) email does not have @ (2) email has been used for register already (3) username has been used for register already
  + Login: 
    + Log in successfully with correct username/email and password
    + Log out successfully
    + Log in unsuccessfully with (1) wrong password for username/email (2) not existing username/email
  + Profile: 
    + View own Profile page
    + Create/Edit Profile page
  + Event: 
    + View All Events page
    + View My Events page
    + Transfer freely among All Events, My Events and Profile pages
    + Create/Read/Edit/Delete event
    + Join and quit event
    + Manage the members of event
  

## Testing: RSpec

+ Use `RSpec` to do the `TDD` in command line:

  ```bash
  bundle exec rspec
  ```

+ All files are in `'./spec'`
+ Pass cucumber with good coverage: 174 / 182 LOC (95.6%) 
+ Design
  + Align with the Model-View-Controller (MVC) pattern
  + Model Tests: Assess key functionalities of the Event, Profile, UserEvent, and User models, including validations of essential attributes, the integrity of model associations, the functionality of enums and callbacks, and the enforcement of uniqueness constraints.
  + View Tests: Ensure the correct rendering of the `events/index` and `users/my_events` views.
  + Controller Tests:  Test the HTTP request-response cycle for various routes, including user authentication (login and logout), user registration, profile creation, and event management, ensuring correct behavior, status codes, and redirections based on valid and invalid input scenarios.
  + Request Tests: Validate the HTTP request-response cycle across various controllers, including the handling of user sessions, profile management, event listing, and user registration, ensuring appropriate responses, redirects, and view renderings for both valid and invalid user interactions.
  + Helper Tests:  Validate the functionality of ApplicationHelper and SessionsHelper modules, specifically testing methods like `current_user`, `logged_in?`, and `log_in`, to ensure they correctly identify and manage user login states.

## Deployment

+ We deploy our app in `Heroku`.
