class ContrasenaResetsController < ApplicationController
  def new
  	 @software_abogado = SoftwareAbogado.new
  end

  def create
  	usuario = Usuario.find_by_username(params[:mail])
    @cantidadUsuario = Usuario.where(username: params[:mail]).count
    
    if @cantidadUsuario == 0
     redirect_to new_contrasena_reset_path , :notice => "El usuario "+params[:mail]+" no existe"
    else
      usuario.send_reset_pass if usuario
      redirect_to :home, :notice => "Se ha enviado correo con instrucciones"
    end
  	
  end

  def edit
    @usuario =  Usuario.find_by_password_reset_token!(params[:id])
  end

  def update
    @usuario =  Usuario.find_by_password_reset_token!(params[:id])
    if @usuario.password_reset_sent_at < 2.hours.ago
      redirect_to new_contrasena_reset_path , :alert => "Token de reinicio a expirado"
    elsif @usuario.update_attributes(params[:usuario])
      redirect_to :home, :notice => "contrasena a sido restablecida"
    else
      render :edit
    end 
  end
end
