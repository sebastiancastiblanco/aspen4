class Proceso < ActiveRecord::Base
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at,:tipo_proceso_id,:estado_proceso_id
  
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
   #tiene varias actviidades
  has_many :logs
  #tiene un tipo de proceso
  belongs_to :tipo_proceso
  #tiene un estado de proceso
  belongs_to :estado_proceso

end
