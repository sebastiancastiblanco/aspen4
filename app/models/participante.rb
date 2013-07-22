class Participante < ActiveRecord::Base
  attr_accessible :apellido, :celular, :correo, :direccion, :documento, :estadoCivil, :fechaNacimiento, :genero, :nombre, :telefono, :tipoDocumento,:updated_at,:rol_participante_id
  
  #Relacion muchos a muchos, para los roles de los participantes
  belongs_to :rol_participante
  #Relacion muchos a muchos, para procesos y particinates
  has_many :proceso_participantes
  has_many :procesos, through: :proceso_participantes
end
