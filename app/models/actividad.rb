class Actividad < ActiveRecord::Base
  attr_accessible :descripcion, :fechaSeguimiento, :medidaTiempo, :nombre, :observacion, :tiempoEjecucion, :created_at
  #pertenece a un proceso
  belongs_to :proceso
  #pertenece a un estado de la actividad
  belongs_to :estado_actividad
end
