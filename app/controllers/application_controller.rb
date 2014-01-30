class ApplicationController < ActionController::Base


  private
  def not_authenticated
    redirect_to :login, :notce => "Debes iniciar sesion."
  end

  
end
