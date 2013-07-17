class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!
  
  #Atributos accesibles por la vista
  attr_accessible :username, :email, :password, :password_confirmation
  
  #Validacion de password
  validates_confirmation_of :password, message: "Ambos campos deben coincidir"

  #Un Usuario (Abogado) tiene varios procesos
  has_many :control_accesos
  has_many :procesos, through: :control_accesos

  #Relacion Un Despacho tiene (has_many)  varios abogados
  has_many :abogados , class_name: "Usuario", foreign_key: "despacho_id"
 
  #Relacion un usuario(abogado) pertenece a un despacho.
  belongs_to :despacho, class_name: "Usuario"
  
  #validates :username, :presence => true
  #validates :email, :presence => true
  #validates :password, :presence => true
  #validates :password_confirmation, :presence => true

end
