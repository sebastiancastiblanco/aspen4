class Alerta < ActiveRecord::Base
  attr_accessible :comienza, :hora, :nota, :repeticion, :termina, :titulo, :horainicio,:notificarMail,:abogado_id
  #validaciones campos obligatorios
   validates :titulo, :termina,:nota, :presence => { :message => "Campo obligatorio"}
  
  #Pertenece a un proceso
  belongs_to :proceso
  #tiene un evento
  has_one :evento

  #Scope para la tabla para recuperar las alertas activas.
  scope :activos, where(:activo => true)

  #Scope para la tabla y recuperar las alertas disponibles para enviar recordatorios.
  scope :activosRecordatorios, where(:activo => true,:notificarMail => true )
end
