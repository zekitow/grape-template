# Grape template

Simple boilerplate using Grape to build APIs that includes ActiveRecord (with mysql), migrations and rspec.

## Starting

### Dependencies

    bundle install

### Database

Change the *config/database.yml* and sets your username:

  ```yaml
  defaults: &defaults
    adapter: mysql2
    encoding: utf8
    host: localhost
    username: root
    password:
    pool: 5

  development:
    database: grape_development
    <<: *defaults

  test:
    database: grape_test
    <<: *defaults

  production:
    database: grape_production
    <<: *defaults
  ```

### Migrations

Create a *Todo* sample:

  ```
  rake db:create db:migrate db:seed
  ```


### Run the App

  ```
  puma -p 3000
  ```

And go to *http://localhost:3000/api/todos*

## Tests

I've added rspec for testing. So, you have to run the migration at RACK_ENV=test

  ```
  RACK_ENV=test rake db:create db:migrate
  ```

### Run the tests

  ```
  rspec
  ```

Then you should see something like:

  ```
  ..
  Finished in 0.04674 seconds (files took 0.71477 seconds to load)
  2 examples, 0 failures
  ```

**Have fun** :beer:
