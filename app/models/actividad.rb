class Actividad < ActiveRecord::Base
  attr_accessible :activo, :descripcion, :fechaSeguimiento,:fechaseguir, :medidaTiempo, :nombre, :observacion, :tiempoEjecucion, :created_at, :estado_actividad_id, :updated_at, :participante_id,:actividad_eventos
  #Validaciones
  validates :nombre, :participante_id, :fechaSeguimiento,:fechaseguir,:estado_actividad_id, :tiempoEjecucion,:medidaTiempo, :presence => { :message => "Campo obligatorio"}
  
  #Validaciones de longitud
  validates :nombre, length: { minimum: 3,  :message => "Longitud minima de 3 caracteres"  }
  
  #validates :descripcion, length: { minimum: 10,  :message => "Longitud minima de 10 caracteres"  }, :unless => "descripcion.nil?" 
  validates :descripcion, length: { maximum: 250,  :message => "Longitud maxima de 250 caracteres"  }, :unless => "descripcion.nil?" 
  validates :observacion, length: { maximum: 250,  :message => "Longitud maxima de 250 caracteres"  }, :unless => "observacion.nil?" 
  
  #pertenece a un proceso
  belongs_to :proceso
  
  #pertenece a un estado de la actividad
  belongs_to :estado_actividad
 
  #Tiene un participante
  belongs_to :participante

  #tiene varias actividades Eventos
  #has_many :actividad_eventos

  #Scope para la tabla
  scope :activos, where(:activo => true)
  #Scope para la tabla
  scope :ascendentes, order(:fechaseguir)

end
