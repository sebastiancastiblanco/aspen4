class Participante < ActiveRecord::Base
  attr_accessible :apellido, :celular, :correo, :direccion, :documento, :estadoCivil, :fechaNacimiento, :genero, :nombre, :telefono, :tipoDocumento,:updated_at,:rol_participante_id
  
  #Validaciones
  validates :apellido, :nombre, :correo, :presence => { :message => "Campo obligatorio"}
  #validates :documento, :numericality => { :only_integer => true , :message => "Valor Numerico" }

  #Relacion muchos a muchos, para los roles de los participantes
  belongs_to :rol_participante
  #Relacion muchos a muchos, para procesos y particinates
  has_many :proceso_participantes
  has_many :procesos, through: :proceso_participantes
  #relacion con las actividades
  has_many :actividads
end
