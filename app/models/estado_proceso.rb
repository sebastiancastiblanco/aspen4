class EstadoProceso < ActiveRecord::Base
  attr_accessible :estado
  #relacion con el proceso
  has_many :procesos
end
