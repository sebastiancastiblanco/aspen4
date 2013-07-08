class Proceso < ActiveRecord::Base
  attr_accessible :ciudad, :favorito, :objetivo, :procesoHomologado, :referencia, :resumen, :titulo,:updated_at
end
