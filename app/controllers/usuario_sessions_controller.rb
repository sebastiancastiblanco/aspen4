class UsuarioSessionsController < ApplicationController
	def new 
		@usuario = Usuario.new
	end
	def create
		if @usuario = login(params[:username],params[:password])
			redirect_back_or_to(:procesos ,message: "login exitoso")
		else
			flash.now[:alert] = "error en el login"
			redirect_to(:home, message: "no existe el usuario")
		end
	end
	def destroy 
		logout
		redirect_to(:home, message: "finaliza sesion")
	end
end