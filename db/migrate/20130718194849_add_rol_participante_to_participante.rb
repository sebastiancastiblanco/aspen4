class AddRolParticipanteToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :rol_participante_id, :integer
  end
end
