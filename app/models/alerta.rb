class Alerta < ActiveRecord::Base
  attr_accessible :comienza, :hora, :nota, :repeticion, :termina, :titulo, :horainicio
  #validaciones campos obligatorios
   validates :titulo, :termina,:nota, :presence => { :message => "Campo obligatorio"}
  
  #Pertenece a un proceso
  belongs_to :proceso
  #tiene un evento
  has_one :evento

  #Scope para la tabla
  scope :activos, where(:activo => true)
end
