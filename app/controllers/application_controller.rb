class ApplicationController < ActionController::Base
  protect_from_forgery
	#private
	#def current_user
  	#	@current_user ||= User.find_by_auth_token!(cookies[:authToken]) if cookies[:authToken]
	#end

  private
  def not_authenticated
    redirect_to :login, :notce => "Debes iniciar sesion."
  end

end
