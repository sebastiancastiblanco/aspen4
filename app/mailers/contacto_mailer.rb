class ContactoMailer < ActionMailer::Base
  default from: "aspen.abogados@gmail.com"

   def contactoUsuario (usuario,proceso,correo,mensaje)
    @usuario = usuario
    @mensaje  = mensaje
    @proceso = proceso 
	 mail to: correo, subject: "[Aspen] Mensaje de "+usuario.email,from: "aspen.abogados@gmail.com"
  end

   def compartirProcesoUsuario (usuario,proceso,correo)
    @usuario = usuario
    @proceso = proceso 
	mail to: correo, subject: "[Aspen] "+usuario.email+" a compartido un nuevo proceso",from: "aspen.abogados@gmail.com"
  end

  def enviarInvitacion (usuario,correo)
    @usuario = usuario
    @url = 'http://www.aspen-abogados.com/abogados/sign_up'
    mail to: correo, subject: "[Aspen] Unete y vinculame a tu red "+usuario.email,from: "aspen.abogados@gmail.com"
  end

end
