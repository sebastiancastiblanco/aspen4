class Contrato < ActiveRecord::Base
  attr_accessible :deberes, :fechaFin, :fechaInicio, :formaPago, :objeto, :obligaciones, :participante2, :particpante1, :tipoContrato, :valor

  #Pertenece a un proceso
  belongs_to :proceso
end
