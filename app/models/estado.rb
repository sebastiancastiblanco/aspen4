class Estado < ActiveRecord::Base
  attr_accessible :conclusion, :fecha, :resumen, :tipo

  #Pertenece a un proceso
  belongs_to :proceso
end
