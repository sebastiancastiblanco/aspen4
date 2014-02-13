class ContactoMailer < ActionMailer::Base
  default from: "Aspen@aspen.com"

   def contactoUsuario (usuario,proceso,correo,mensaje)
    @usuario = usuario
    @mensaje  = mensaje
    @proceso = proceso 
	mail to: correo, subject: "[Aspen] Mensaje de "+usuario.email
  end

   def compartirProcesoUsuario (usuario,proceso,correo)
    @usuario = usuario
    @proceso = proceso 
	mail to: correo, subject: "[Aspen] "+usuario.email+" a compartido un nuevo proceso"
  end

end
