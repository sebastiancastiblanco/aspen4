class Alertum < ActiveRecord::Base
  attr_accessible :comienza, :hora, :nota, :repeticion, :termina, :titulo

  #Pertenece a un proceso
  belongs_to :proceso
end
