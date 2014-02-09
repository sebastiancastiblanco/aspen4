class Log < ActiveRecord::Base
  attr_accessible :actividad_id, :alertas_id, :contrato_id, :documento_id, :estado_id, :mensaje,:mensaje_id, :participante_id, :proceso_id, :usuario_id, :created_at, :usuario, :proceso, :abogado_id

   #tiene un proceso
  belongs_to :proceso
end
