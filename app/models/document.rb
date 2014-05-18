class Document < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :attachment_file_name
  attr_accessible :updated_at
  attr_accessible :usuario_id
  attr_accessible :proceso_id
  attr_accessible :activo


 # Atributo que almacena un documento
  attr_accessible :attachment
  has_attached_file :attachment
 # validacion del documento
  #validates_attachment :attachment, :presence => true

  validates_attachment_size :attachment, :less_than => 10.megabytes, :message => :invalid_attachment_size
  #validates_attachment_content_type :attachment , :content_type => "image/png" ,:message => :invalid_attachment_content
  
  #Pertenece a un proceso
  belongs_to :proceso
  belongs_to :usuario

  #Scope para la tabla
  scope :activos, where(:activo => true)

end
