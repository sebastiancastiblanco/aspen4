class ControlAcceso < ActiveRecord::Base
  attr_accessible :controlAcceso_id, :proceso_id, :usuario_id
  belongs_to :proceso
  belongs_to :usuario
end
