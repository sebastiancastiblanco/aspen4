class Contrato < ActiveRecord::Base
  attr_accessible :deberes, :fechaFin, :fechaInicio, :formaPago, :objeto, :obligaciones, :participante2, :particpante1, :tipoContrato, :valor
  #Validaciones
  validates :objeto, :participante2, :particpante1, :valor,:formaPago, :tipoContrato, :presence => { :message => "Campo obligatorio"}
  #Validaciones numericas
  validates :valor, :format => { :with => /^\d+??(?:\.\d{0,3})?$/,:message => "Debe ser un valor Numerico" }, :numericality => {:greater_than => 0,:message => "Debe ser un valor superior a 0"}
  #Validaciones de longitud
  validates :objeto, length: { minimum: 10,  :message => "Longitud minima de 10 caracteres"  }
  validates :objeto, length: { maximum: 250,  :message => "Longitud maxima de 250 caracteres"  }
  validates :formaPago, length: { minimum: 10,  :message => "Longitud minima de 10 caracteres"  }
  validates :formaPago, length: { maximum: 120,  :message => "Longitud maxima de 250 caracteres"  }

  validates :obligaciones, length: { maximum: 250,  :message => "Longitud maxima de 250 digitos"  }, :unless => "obligaciones.nil?" 
  validates :deberes, length: { maximum: 250,  :message => "Longitud maxima de 250 digitos"  }, :unless => "deberes.nil?" 
  
  
  #Pertenece a un proceso
  belongs_to :proceso
end
