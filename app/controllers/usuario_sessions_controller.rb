class UsuarioSessionsController < ApplicationController
	def new 
		@usuario = Usuario.new
	end
	def create
		
		if @usuario = login(params[:username],params[:password])
			if params[:remenber_me]
				cookies.permanent[:authToken] = @usuario.authToken
			else
				cookies[:authToken] = @usuario.authToken
			end

			redirect_back_or_to(:procesos ,notice: "login exitoso")
		else
			redirect_to(:home, notice: "El usuario y contrasena son invalidos")
    	end
	end
	
	def destroy 
		cookies.delete(:authToken)
		logout
		redirect_to(:home, message: "finaliza sesion")
	end
end