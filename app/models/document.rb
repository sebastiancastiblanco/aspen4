class Document < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :attachment
  has_attached_file :attachment

  #Pertenece a un proceso
  belongs_to :proceso
  belongs_to :usuario

  #Scope para la tabla
  scope :activos, where(:activo => true)

end
