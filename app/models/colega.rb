class Colega < ActiveRecord::Base
  attr_accessible :abogado1, :abogado2, :activo, :abogado_id, :email
  belongs_to :abogado
end
