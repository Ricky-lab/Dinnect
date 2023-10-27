# Project: Dinnect 
## Group members:
- Yuehui Ruan
- Ruoxing Liao
- Yifei Luo
- Jianghao Wu
<br>

## Techs and Framework
!! IMPORTANT: make sure your configuations in `gemfile` are correct before developing the project:
- Ruby `3.0.6` <br>
- Installed Gem package:<br>
  1.`PostgreSQL`: database used in this project
  ```
    brew install postgresql 
  ```
  config with `pq` package:
  ```
  gem install pg -- --with-pg-config=/usr/local/bin/pg_config
  ```
  where `/usr/local/bin/pg_config` is the result path that you run `which pg_config`.<br>
  
  2. `Byebug`: Use to set up the breakpoint int the code and debug.  <br>
   ```
    gem install byebug
   ```

  
   <br>
- Ruby on Rails `7.1.1`
  ```
  sudo gem install rails -v 7.1.1
  ```
  then restart the terminal and input
  `rails -v` if saying `7.1.1`, you are good to go.
<br>

## Set up:
- Once you clone the project of your native env, double check the techs and framework version that you are using
- run `bundle update` until you return without errors.
<br>

## Current sprint:
### Sprint 1: Oct 27, 2023
#### Front:
1. Login UI interface
2. Resigter interface
3. Intergration with db

#### Back: 
1. Populating db
2. db deployment
3. MVC testing

#### User story

#### Test unit setting
- Cucumber & RSpec
