class Actividad < ActiveRecord::Base
  attr_accessible :descripcion, :fechaSeguimiento, :medidaTiempo, :nombre, :observacion, :tiempoEjecucion, :created_at, :estado_actividad_id, :updated_at,:participante_id
  #pertenece a un proceso
  belongs_to :proceso
  #pertenece a un estado de la actividad
  belongs_to :estado_actividad
  #Tiene un participante
  belongs_to :participante
end
