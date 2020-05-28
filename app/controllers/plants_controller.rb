class PlantsController < ApplicationController

  # if logged in, a user should see their homepage with their plants listed
  # check that gardener is logged in. If not, redirect to login.
  get '/my_plants' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end
      @plants = Plant.all
      @gardener = Helpers.current_user(session)
      erb :'/gardeners/my_plants'
  end

  # allows gardener to see all their plants
  get '/plants/:slug' do
    # @gardener = find by slug
    # render gardeners plants page
  end

  # make sure user is logged in.
  # if not, flash message and redirect to login
  # render new plant form
  get '/my_plants/new' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end
      erb :'/plants/new'
  end

  # create plant instance with given params
  # if any field is empty, flash message: encourage gardener to update
  # redirect to gardeners home page to see newly created plant
  post '/plants' do
    if !params.empty?
      Plant.create(name: params[:name], amount_of_sun: params[:amount_of_sun], water_frequency: params[:water_frequency], gardener_id: params[:gardener_id])
      redirect '/my_plants'
    else
      flash[:message] = "Make sure you fill in all the details."
      redirect '/my_plants/new'
    end
  end

  # as a gardener, i want to be able to click on a plant and see that plant's own page
  # make sure user is logged in.
  # if not, flash message and redirect to login
  # else find plant by id and render plant's page
  get '/my_plants/:id' do
    if !Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to view plants"
      redirect '/login'
    else
      @plant = Plant.find_by(params[:id])
      erb :'/plants/show_plant'
    end
  end

  # as a gardener, I want to be able to edit a single plants info
  get '/plants/:id/edit' do
    # make sure user is logged in.
    # if not, flash message and redirect to login
    # else find plant by id and render edit form
    # make sure gardeners can't edit other gardeners plants
  end

  post '/plants/:id' do
    # find the plant by the user_id
    # if the fields aren't empty (are changed), @plant.update with new params
    # redirect to /plants/@plant.id so gardener can see their edited plant
  end

  # as a gardener, i want to be able to delete a plant.
  post '/plants/:id/delete' do
    # make sure user is logged in.
    # if not, flash message and redirect to login
    # else find plant by id and delete it
    # redirect to gardeners home page
  end

end
