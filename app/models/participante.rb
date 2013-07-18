class Participante < ActiveRecord::Base
  attr_accessible :apellido, :celular, :correo, :direccion, :documento, :estadoCivil, :fechaNacimiento, :genero, :nombre, :telefono, :tipoDocumento
  has_and_belongs_to_many :roles_participantes
end
