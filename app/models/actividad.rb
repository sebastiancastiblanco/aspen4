class Actividad < ActiveRecord::Base
  attr_accessible :activo, :descripcion, :fechaSeguimiento, :medidaTiempo, :nombre, :observacion, :tiempoEjecucion, :created_at, :estado_actividad_id, :updated_at, :participante_id
  #Validaciones
  validates :nombre, :participante_id, :fechaSeguimiento,:estado_actividad_id, :descripcion, :presence => { :message => "Campo obligatorio"}
  
  #Validaciones de longitud
  validates :nombre, length: { minimum: 3,  :message => "Longitud minima de 3 caracteres"  }
  
  validates :descripcion, length: { minimum: 10,  :message => "Longitud minima de 10 caracteres"  }
  validates :descripcion, length: { maximum: 250,  :message => "Longitud maxima de 250 caracteres"  }
  validates :observacion, length: { maximum: 250,  :message => "Longitud maxima de 250 caracteres"  }, :unless => "observacion.nil?" 
  
  #pertenece a un proceso
  belongs_to :proceso
  #pertenece a un estado de la actividad
  belongs_to :estado_actividad
  #Tiene un participante
  belongs_to :participante

  #tiene varias actividades Eventos
  has_many :actividad_eventos

  #Scope para la tabla
  scope :activos, where(:activo => true)

end
