require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/signup' do
  # if not logged in, redirect to signup page
    erb :signup
  end

  post '/signup' do
    # check all fields have been filled in
    # check to see if user exists.
    # if not, Gardener.create to make a new instance of a Gardener
    # if so, flash message to tell them an account exists and redirect to login page
  end

end
