class Actividad < ActiveRecord::Base
  attr_accessible :descripcion, :fechaSeguimiento, :medidaTiempo, :nombre, :observacion, :tiempoEjecucion, :created_at, :estado_actividad_id, :updated_at, :participante_id
  #Validaciones
  validates :nombre, :participante_id, :fechaSeguimiento,:estado_actividad_id, :descripcion, :presence => { :message => "Campo obligatorio"}

  #pertenece a un proceso
  belongs_to :proceso
  #pertenece a un estado de la actividad
  belongs_to :estado_actividad
  #Tiene un participante
  belongs_to :participante
end
