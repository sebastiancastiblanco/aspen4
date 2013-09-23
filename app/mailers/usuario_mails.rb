class UsuarioMails < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mails.recuperarContrasena.subject
  #
  def recuperarContrasena (email)
     @email = email
     @url  = 'http://localhost:3000/login '

    mail to: email, subject: "Aspen recuperar contrasena"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mails.bienvenida.subject
  #
  def bienvenida (usuario)
     @usuario = usuario
     @url  = 'http://localhost:3000/login '

    mail to: usuario.username, subject: "Aspen - Bienvenido"
  end
end
