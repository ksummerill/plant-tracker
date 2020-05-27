class GardenersController < ApplicationController

  get '/signup' do
  # if logged in, redirect to my_plants page
    if Helpers.is_logged_in?(session)
      redirect '/gardeners/my_plants'
    else
      erb :'/gardeners/signup'
    end
  end

  post '/signup' do
    # check all fields have been filled in. if they aren't, flash message to ask user to fill in completely
    # check to see if user exists. If so, flash message to tell them an account exists and redirect to login page
    # if not, Gardener.create to make a new instance of a Gardener and log that user in - show them their homepage (my_plants)
    if params.empty?
      flash[:error] = "Please complete all fields to sign up"
      redirect '/signup'
    elsif Gardener.find_by(params[:id])
      flash[:message] = "You've got an account! Let's get you logged in."
      redirect '/login'
    else
      @gardener = Gardener.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @gardener.id
      # right now, new accounts are redirecting to /login
      redirect '/my_plants'
    end
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
