class PlantsController < ApplicationController

  # if logged in, a user should see all plants, even from other gardeners
  get '/my_plants' do
    # check that gardener is logged in. If not, redirect to login.
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
    # make sure user is logged in.
    # if not, flash message and redirect to login
    # else find plant by id and render plant's page
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
