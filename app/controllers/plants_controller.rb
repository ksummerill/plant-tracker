class PlantsController < ApplicationController

  # if logged in, a gardener should see their homepage with their plants listed
  # check that gardener is logged in. If not, redirect to login.
  get '/my_plants' do
    if !Helpers.is_logged_in?(session)
      redirect '/login'
    end
      @plants = Helpers.my_plants(session)
      @gardener = Helpers.current_user(session)
      erb :'/gardeners/my_plants'
  end

  # if logged in, a gardener should be able to create a new plant
  # make sure user is logged in. if not, flash message and redirect to login
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
    # created a plant without a name and 'params' gave me {"name"=>"", "amount_of_sun"=>"shade", "water_frequency"=>"daily"}
    if params.none? {|key, value| value == ""}
      @plant = Plant.create(name: params[:name], amount_of_sun: params[:amount_of_sun], water_frequency: params[:water_frequency], gardener_id: session[:gardener_id])
      @plant.gardener = Helpers.current_user(session)
      redirect '/my_plants'
    else
      flash[:error] = "Make sure you fill in all the details."
      redirect '/my_plants/new'
    end
  end

  # as a gardener, I want to be able to click on a plant and see that plant's own page
  # make sure user is logged in. if not, flash message and redirect to login
  # else find plant by id and render plant's page
  get '/my_plants/:id' do
    if !Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to view plants"
      redirect '/login'
    else
      @plant = Plant.find_by(params)
      erb :'/plants/show_plant'
    end
  end

  # as a gardener, I want to be able to edit a single plants info
  # make sure user is logged in. if not, flash message and redirect to login
  # else find plant by id and render edit form
  # make sure gardeners can't edit other gardeners plants
  get '/my_plants/:id/edit' do
    if !Helpers.is_logged_in?(session)
      flash[:message] = "You must be logged in to view plants"
      redirect '/login'
    else
      # @plant here gives me Oregano (id = 33) / correct
      @plant = Plant.find_by_id(params[:id])
      # binding.pry
      erb :'/plants/edit_plant'
    end
  end

  # find the plant by id
  # check fields for new values, @plant.update with new params
  # redirect to /plants/@plant.id so gardener can see their edited plant
  patch '/my_plants/:id' do
    @plant = Plant.find_by_id(params[:id])
    if !params[:amount_of_sun].empty? && !params[:water_frequency].empty?
      @plant.update(amount_of_sun: params[:amount_of_sun], water_frequency: params[:water_frequency])
      flash[:message] = "Successfully updated plant."
      redirect "my_plants/#{@plant.id}"
    end
  end

  # as a gardener, i want to be able to delete a plant.
  # make sure user is logged in. if not, flash message and redirect to login
  # else find plant by id and delete it
  # redirect to gardeners home page
  post '/plants/:id/delete' do
    @plant = Plant.find_by_id(params[:id])
    if !Helpers.is_logged_in?(session)
      flash[:error] = "You must be logged in to delete a plant"
      redirect '/login'
    else
      @plant.delete
      redirect '/my_plants'
    end
  end

end
