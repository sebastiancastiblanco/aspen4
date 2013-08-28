class UsuarioEvento < ActiveRecord::Base
  attr_accessible :event_id, :usuario_id, :propietario_id
  belongs_to :event
  belongs_to :usuario
end
