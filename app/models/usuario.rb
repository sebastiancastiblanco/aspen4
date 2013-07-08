class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  validates_confirmation_of :password, message: "Ambos campos deben coincidir"
end
