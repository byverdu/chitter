#Chitter


We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

You can send some chitts by following this [link](http://chitter-byver.herokuapp.com/)

###Features:
1. In order to use chitter as a maker I want to sign up to the service

2. In order to user chitter as a maker I want to log in

3. In order to avoid others to use my account as a maker I want to log out

4. In order to let people know what I am doing as a maker I want to post a message to chitter

5. In order to see what people have to say as a maker I want to see all peeps in chronological order


###Notes:

Makers sign up to chitter with their email, password, name and a user name (i.e. aloha@makersacademy.com, s3cr3t, Albert Vallverdu, byverdu)

The username and email are unique

Peeps (posts to chitter) have the name of the maker and their user handle

Use bcrypt to secure the passwords

Use data mapper and postgres to save the data

You don't have to be logged in to see the peeps

You only can peep if you are logged in.


##Bonus:

If you have time you can implement the following:

In order to start a conversation as a maker I want to reply to a peep from another maker.

Or / and:

Work on the css to make it look good (we all like beautiful things).

#### Technologies used: 

1. Ruby 

2. RSpec 

3. Capybara

1. Sass

1. CSS and HTML

#### How to run tests

```ruby

# Clone or download this repository

$ git clone git@github.com:byverdu/chitter.git

# Change into the directory:

$ cd chitter

# Install all dependencies:

$ bundle install

# Create a local database:

$ psql
  =# CREATE DATABASE chitter_test;

  =# \q

# Run the auto-upgrade task:

$ rake auto_upgrade

# Run RSpec:

$ rspec

```










