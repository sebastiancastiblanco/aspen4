class Participante < ActiveRecord::Base
  attr_accessible :apellido, :celular, :correo, :direccion, :documento, :estadoCivil, :fechaNacimiento, :genero, :nombre, :telefono, :tipoDocumento,:updated_at,:rol_participante_id
  
  #Validaciones campos obligatorios
  validates :apellido, :nombre, :correo, :presence => { :message => "Campo obligatorio"}
  #Validaciones numericas
  validates :documento,:telefono,:celular , numericality: { :only_integer => true,  :message => "Debe ser un valor Numerico" }
  #Validaciones de longitud
  validates :apellido,:nombre, length: { minimum: 2,  :message => "Longitud minima de 2 caracteres"  }
  validates :documento, length: { minimum: 4,  :message => "Longitud minima de 4 caracteres"  }
  validates :telefono, length: { minimum: 7,  :message => "Longitud minima de 7 digitos"  }
  validates :celular, length: { minimum: 10,  :message => "Longitud minima de 10 digitos"  }
  

  #validates :telefono, numericality: { :only_integer => true,  :message => "Debe ser un valor Numerico" }
  #validates :documento, :numericality => { :only_integer => true , :message => "Valor Numerico" }

  #Relacion muchos a muchos, para los roles de los participantes
  belongs_to :rol_participante
  #Relacion muchos a muchos, para procesos y particinates
  has_many :proceso_participantes
  has_many :procesos, through: :proceso_participantes
  #relacion con las actividades
  has_many :actividads
end
