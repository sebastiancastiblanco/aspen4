class UsuarioSessionsController < ApplicationController
	def new 
		@usuario = Usuario.new
	end
	def create
		
		if @usuario = login(params[:username],params[:password])
			
			redirect_to(:procesos, message: "finaliza sesion")
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