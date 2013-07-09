class Proceso < ActiveRecord::Base
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at
  
#Validaciones de título
#validates :titulo, :presence => {:message => "Usted debe ingresar un título"}, length: {minimum: 2, maximum: 50, :message => "El título debe tener entre 2 y 50 caracteres"}
#Validaciones de descripción
#validates :objetivo, :presence => {:message => "Usted debe ingresar un objetivo"}, length: {minimum: 2, maximum: 250, :message => "el obejtivo debe tener entre 2 y 250 caracteres"}
#Validaciones de prioridad
#validates :referencia, :presence => {:message => "Usted debe ingresar una referencia"}, :numericality => {:only_integer => true, :message => "La referencia debe ser numérica"}

end
