class ActividadEvento < ActiveRecord::Base
  attr_accessible :actividad_id, :descripcion, :fecha, :tiempo, :usuario_id, :medidaTiempo

  #belongs_to :actividad
end
