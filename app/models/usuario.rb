class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation
  # attr_accessible :title, :body
  validates_confirmation_of :password, message: "Ambos campos deben coincidir"
  
  has_many :procesos


  
  #validates :username, :presence => true
  #validates :email, :presence => true
  #validates :password, :presence => true
  #validates :password_confirmation, :presence => true

end
