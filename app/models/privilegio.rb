class Privilegio < ActiveRecord::Base
  attr_accessible :descripcion,:privilegio_id

  has_many :control_accesos
end
