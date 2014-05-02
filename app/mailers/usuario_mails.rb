class UsuarioMails < ActionMailer::Base
  default from: "Aspen@aspen.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mails.recuperarContrasena.subject
  #
  def recuperarContrasena (user)
     @usuario = user
     mail to: user.username, subject: "[Aspen] Recuperar contrasena"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mails.bienvenida.subject
  #
  def bienvenida (abogado)
     @usuario = abogado
     @url  = 'http://aspen-abogados-online.herokuapp.com/abogados/sign_in '

    mail to: abogado.email, subject: "[Aspen] Bienvenido a Aspen"
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mails.bienvenida.subject
  #
  def registroNoticias (correo)
     @correo = correo
     mail to: correo, subject: "[Aspen] Gracias por tu registro"
  end
end
