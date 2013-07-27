class ProcesoParticipante < ActiveRecord::Base
  attr_accessible :participante_id, :proceso_id
  belongs_to :proceso
  belongs_to :participante
end
