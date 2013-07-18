class RolParticipante < ActiveRecord::Base
  attr_accessible :rol
  has_and_belongs_to_many :participantes
end
