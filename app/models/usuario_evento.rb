class UsuarioEvento < ActiveRecord::Base
  attr_accessible :evento_id, :usuario_id, :propietario_id
  belongs_to :evento
  belongs_to :usuario
end
