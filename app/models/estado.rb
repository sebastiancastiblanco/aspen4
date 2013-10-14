class Estado < ActiveRecord::Base
  attr_accessible :conclusion, :fecha, :resumen, :tipo

  #validaciones campos obligatorios
  validates :conclusion, :resumen, :presence => { :message => "Campo obligatorio"}
  

  #Pertenece a un proceso
  belongs_to :proceso
end
