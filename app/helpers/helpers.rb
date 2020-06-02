# method for checking current_user
# method for checking if a user is signed in
class Helpers

  def self.current_user(session)
    @gardener = Gardener.find(session[:gardener_id])
  end

  def self.is_logged_in?(session)
    !!session[:gardener_id]
  end

end
