class EstadoActividad < ActiveRecord::Base
  attr_accessible :estado
  #se encuentra en varias actividades
  has_many :actividads
end
