require 'pry'
require 'sinatra'
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# this will store your users
users = []

# this will store an id to user for your users
# you'll need to increment it every time you add
# a new user, but don't decrement it
id = 1

# routes to implement:
#
# GET / - show all users
get '/' do
  @users = users
  erb :index
end

# GET /users/new - display a form for making a new user
get '/users/new' do
  erb :new_user
end
#
# POST /users - create a user based on params from form
post '/users' do
  return "Please add values before clicking the 'Add User' button" if params[:first]=="" || params[:last]==""
  uhash = {}
  uhash[:id] = id
  uhash[:first] = params[:first]
  uhash[:last] = params[:last]
  id += 1
  users<< uhash
  redirect to '/'
end
#
# GET /users/:id - show a user's info by their id, this should display the info in a form
get '/users/:id' do
  @user = users[params[:id].to_i - 1]
  erb :user_detail
end
#
# PUT /users/:id - update a user's info based on the form from GET /users/:id
put '/users/:id' do
  namer = users[params[:id].to_i - 1]
  namer[:first] = params[:first]
  namer[:last] = params[:last]
  redirect to '/'
end
#
# DELETE /users/:id - delete a user by their id
delete '/users/:id' do
  users.delete_at(params[:id].to_i - 1)
  redirect to '/'
end

