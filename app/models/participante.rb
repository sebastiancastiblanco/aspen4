class Participante < ActiveRecord::Base
  attr_accessible :activo,:apellido, :celular, :correo, :direccion, :documento, :estadoCivil, :fechaNacimiento, :genero, :nombre, :telefono, :tipoDocumento,:updated_at,:rol_participante_id,:proceso_id
  
  #Validaciones campos obligatorios
  validates :apellido, :nombre, :correo, :presence => { :message => "Campo obligatorio"}
  #Validaciones numericas
  validates :documento, numericality: { :only_integer => true,  :message => "Debe ser un valor Numerico" }, :unless => "documento.nil?"
  validates :telefono, numericality: { :only_integer => true,  :message => "Debe ser un valor Numerico" }, :unless => "telefono.nil?" 
  validates :celular, numericality: { :only_integer => true,  :message => "Debe ser un valor Numerico" }, :unless => "celular.nil?" 
  #Validaciones de longitud
  validates :apellido,:nombre, length: { minimum: 3,  :message => "Longitud minima de 3 caracteres"  }
  validates :documento, length: { minimum: 4,  :message => "Longitud minima de 4 digitos"  }, :unless => "documento.nil?" 
  validates :telefono, length: { minimum: 7,  :message => "Longitud minima de 7 digitos"  }, :unless => "telefono.nil?" 
  validates :celular, length: { minimum: 10,  :message => "Longitud minima de 10 digitos"  }, :unless => "celular.nil?" 

  #Relacion muchos a muchos, para los roles de los participantes
  belongs_to :rol_participante
  #Pertenece a un proceso
  belongs_to :proceso
  #relacion con las actividades
  has_many :actividads
end
