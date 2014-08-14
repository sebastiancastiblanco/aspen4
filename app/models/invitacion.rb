class Invitacion < ActiveRecord::Base
  attr_accessible :abogado1, :aceptado, :tomail

  belongs_to :abogado

  scope :solicitudes, ->(mail) {self.solicitud(mail)}
  
  def self.solicitud(mail)
    where("tomail = ? AND aceptado =? ", mail,false)
  end

  scope :noactivos, where(aceptado: false)
  scope :activos, where(aceptado: true)

end
