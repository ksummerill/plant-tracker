class GardenersController < ApplicationController

  get '/signup' do
  # if not logged in, redirect to signup page
    erb :'gardeners/signup'
  end

  post '/signup' do
    # check all fields have been filled in
    # check to see if user exists.
    # if not, Gardener.create to make a new instance of a Gardener
    # if so, flash message to tell them an account exists and redirect to login page
  end

  get '/login' do
    # if not logged in, redirect to login page
    # else redirect to gardeners home page
  end

  post '/login' do
    # make sure a gardener with these params exists and authenticate them
    # if good, log them in
    # if not, flash error message to tell them to try again
  end

  get '/logout' do
    # session.clear
    # flash goodbye message
    # redirect to login
  end

end
