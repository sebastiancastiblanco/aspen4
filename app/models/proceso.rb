class Proceso < ActiveRecord::Base
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at,:tipo_proceso_id
  
  has_many :control_accesos
  has_many :usuarios, through: :control_accesos
 
  has_many :proceso_participantes
  has_many :participantes, through: :proceso_participantes
  #tiene varios contratos
  has_many :contratos
  #tiene varias actviidades
  has_many :actividads

  #tiene un tipo de proceso
  belongs_to :tipo_proceso

#Validaciones de título
#validates_presence_of :titulo, :presence => {:message => "Usted debe ingresar un título"}, length: {minimum: 2, maximum: 50, :message => "El título debe tener entre 2 y 50 caracteres"}
validates :titulo, :objetivo, :ciudad, :referencia, :presence => { :message => "Campo obligatorio"}

#validates_length_of 
#validates_numericality_of
#validates_size_of

#Validaciones de descripción
#validates :objetivo, :presence => {:message => "Usted debe ingresar un objetivo"}, length: {minimum: 2, maximum: 250, :message => "el obejtivo debe tener entre 2 y 250 caracteres"}
#Validaciones de prioridad
#validates :referencia, :presence => {:message => "Usted debe ingresar una referencia"}, :numericality => {:only_integer => true, :message => "La referencia debe ser numérica"}

end
