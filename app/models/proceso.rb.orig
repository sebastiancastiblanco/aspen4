class Proceso < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at,:tipo_proceso_id,:estado_proceso_id
  
=======
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at,:tipo_proceso_id

>>>>>>> alexAspen
  #Validaciones de título
  validates :titulo, :objetivo, :ciudad, :presence => { :message => "Campo obligatorio"}

  #Procesos a los cuales se tiene acceso
  has_many :control_accesos
  has_many :usuarios, through: :control_accesos

  #participantes del proceso
  has_many :participantes

  #tiene varios contratos
  has_many :contratos
  #tiene varias actviidades
  has_many :actividads

 #tiene varias alertas
  has_many :alertas

   #tiene varios documentos
  has_many :documents

   #tiene varios estados
  has_many :estados

  #tiene un tipo de proceso
  belongs_to :tipo_proceso
  #tiene un estado de proceso
  belongs_to :estado_proceso

end
