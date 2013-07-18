class RolesParticipantes < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :rol_participante
  belongs_to :participante
end
