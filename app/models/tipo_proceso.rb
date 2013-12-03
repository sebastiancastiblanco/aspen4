class TipoProceso < ActiveRecord::Base
  attr_accessible :tipo,:usuario_id

  #pertenece a un superUsuario
  #belongs_to :usuario
  #Relacion a muchos Procesos
  has_many :procesos
end
