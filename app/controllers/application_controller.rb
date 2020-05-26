require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # gardener_controller...

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

  # plants_controller...

  # if logged in, a user should see all plants, even from other gardeners
  get '/plants' do
    # check that gardener is logged in. If not, redirect to login.
    # @plants = Plant.all
    # @gardener = Helpers....
    # render plants page
  end

  # allows gardener to see all their plants
  get '/plants/:slug' do
    # @gardener = find by slug
    # render gardeners plants page
  end

  get '/plants/new' do
    # make sure user is logged in.
    # if not, flash message and redirect to login
    # render new plant form
  end

  post '/plants' do
    # create plant instance with given params
    # if any field is empty, flash message: encourage gardener to update
    # redirect to gardeners home page to see newly created plant
  end

  # as a gardener, i want to be able to click on a plant and see that plant's own page
  get '/plants/:id' do
    
  end


end
