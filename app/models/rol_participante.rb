class RolParticipante < ActiveRecord::Base
  attr_accessible :rol
  has_many :participantes
end
