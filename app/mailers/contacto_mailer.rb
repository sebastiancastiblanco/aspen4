class ContactoMailer < ActionMailer::Base
  default from: "Aspen@aspen.com"

   def contactoUsuario (usuario,proceso,correo,mensaje)
    @usuario = usuario
    @mensaje  = mensaje
    @proceso = proceso 
	mail to: correo, subject: "[Aspen] Mensaje de "+usuario.nombre+" ("+usuario.username+")"
  end

   def compartirProcesoUsuario (usuario,proceso,correo)
    @usuario = usuario
    @proceso = proceso 
	mail to: correo, subject: "[Aspen] "+usuario.nombre+" ("+usuario.username+") a compartido un nuevo proceso"
  end

end
