class AddParticipanteIdToRolesParticipante < ActiveRecord::Migration
  def change
    add_column :roles_participantes, :participante_id, :integer
  end
end
