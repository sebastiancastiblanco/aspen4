class AddParticipanteIdToActividades < ActiveRecord::Migration
  def change
    add_column :actividads, :participante_id, :integer
  end
end
