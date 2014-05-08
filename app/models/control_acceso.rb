class ControlAcceso < ActiveRecord::Base
  attr_accessible :controlAcceso_id, :proceso_id, :usuario_id, :privilegio_id,:abogado_id

  #delegate
  delegate :email, to: :abogado, prefix: true

  belongs_to :proceso
  belongs_to :usuario
  belongs_to :abogado
  belongs_to :privilegio
  #buscar control de aceso por proceso y usuario
  def self.buscarProcesoAcceso(procesoid, usuarioid)
    where(
        :proceso_id => procesoid,:abogado_id => usuarioid
    )
   end

  def abogado_email
    abogado.email if abogado
  end

  def abogado_email=(email)
    self.abogado = Abogado.find_by_email(email) unless email.blank?
  end

end
