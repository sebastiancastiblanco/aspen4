class Alerta < ActiveRecord::Base
  attr_accessible :comienza, :hora, :nota, :repeticion, :termina, :titulo
  #validaciones campos obligatorios
   validates :titulo, :comienza,:nota, :presence => { :message => "Campo obligatorio"}
  
  #Pertenece a un proceso
  belongs_to :proceso
end
