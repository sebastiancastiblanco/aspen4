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
  def bienvenida (usuario)
     @usuario = usuario
     @url  = 'http://localhost:3000/ingresoCuenta '

    mail to: usuario.username, subject: "[Aspen] Bienvenido a Aspen"
  end
end
