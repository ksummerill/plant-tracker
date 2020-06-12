class GardenersController < ApplicationController

  # if logged in, redirect to my_plants page
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/my_plants'
    else
      erb :'/gardeners/signup'
    end
  end

  # check all fields have been filled in. if they aren't, flash message to ask user to fill in completely
  # check to see if user exists. If so, flash message to tell them an account exists and redirect to login page
  # if not, Gardener.create to make a new instance of a Gardener and log that user in - show them their homepage (my_plants)
  post '/signup' do
    if params.none? {|key, value| value == ""}
      @gardener = Gardener.create(username: params[:username], email: params[:email], password: params[:password])
      session[:gardener_id] = @gardener.id
      redirect '/my_plants'
    else
      flash[:error] = "Please complete all fields to sign up"
      redirect '/signup'
    end
  end

  # if not logged in, redirect to login page
  # else redirect to gardeners home page
  get '/login' do
    if !Helpers.is_logged_in?(session)
      erb :'/gardeners/login'
    else
      redirect '/my_plants'
    end
  end

  # make sure a gardener with these params exists and authenticate them
  # if good, log them in
  # if not, flash error message to tell them to try again. Redirect to login.
  post '/login' do
    @gardener = Gardener.find_by(username: params[:username])
    if @gardener && @gardener.authenticate(params[:password])
      session[:gardener_id] = @gardener.id
      redirect '/my_plants'
    else
      flash[:error] = "We couldn't find you. Please try again!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = "See you later!"
    redirect '/login'
  end

end
