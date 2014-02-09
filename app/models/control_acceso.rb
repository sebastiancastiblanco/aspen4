class ControlAcceso < ActiveRecord::Base
  attr_accessible :controlAcceso_id, :proceso_id, :usuario_id, :privilegio_id,:abogado_id
  belongs_to :proceso
  belongs_to :usuario
  belongs_to :abogado
  belongs_to :privilegio
  #buscar control de aceso por proceso y usuario
  def self.buscarProcesoAcceso(procesoid, usuarioid)
    where(
        'proceso_id = :procesoid and usuario_id = :usuarioid',
        :proceso_id => procesoid,:abogado_id => usuarioid
    )
   end

end
