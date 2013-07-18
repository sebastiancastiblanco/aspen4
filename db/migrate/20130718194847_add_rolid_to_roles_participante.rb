class AddRolidToRolesParticipante < ActiveRecord::Migration
  def change
    add_column :roles_participantes, :rolParticipante_id, :integer
  end
end
