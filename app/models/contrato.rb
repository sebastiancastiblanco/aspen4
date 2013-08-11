class Contrato < ActiveRecord::Base
  attr_accessible :deberes, :fechaFin, :fechaInicio, :formaPago, :objeto, :obligaciones, :participante2, :particpante1, :tipoContrato, :valor
  #Validaciones
  validates :objeto, :participante2, :particpante1, :valor,:formaPago, :tipoContrato, :presence => { :message => "Campo obligatorio"}

  #Pertenece a un proceso
  belongs_to :proceso
end
