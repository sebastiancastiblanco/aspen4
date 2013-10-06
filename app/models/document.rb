class Document < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :attachment
  has_attached_file :attachment

  #Pertenece a un proceso
  belongs_to :proceso
end
