# method for checking current_user
# method for checking if a user is signed in
class Helpers

  def self.current_user(session)
    @gardener = Gardener.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end
