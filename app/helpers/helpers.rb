class Helpers

  # method for checking current_user
  def self.current_user(session)
    @gardener = Gardener.find(session[:gardener_id])
  end

  # method for checking if a user is signed in
  def self.is_logged_in?(session)
    !!session[:gardener_id]
  end

  # grab all plants where the session[:gardener_id] == Plant.gardener_id
  def self.my_plants(session)
    @gardener = Gardener.find(session[:gardener_id])
    @my_plants = @gardener.plants
  end

end
