require 'test_helper'

class UsuarioMailsTest < ActionMailer::TestCase
  test "recuperarContrasena" do
    mail = UsuarioMails.recuperarContrasena
    assert_equal "Recuperarcontrasena", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "bienvenida" do
    mail = UsuarioMails.bienvenida
    assert_equal "Bienvenida", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
