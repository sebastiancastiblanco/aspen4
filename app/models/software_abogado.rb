class SoftwareAbogado < ActiveRecord::Base
  attr_accessible :correo, :nombre
  #Validaciones
  validates :correo, :presence => { :message => "El correo es necesario"}
  

end
