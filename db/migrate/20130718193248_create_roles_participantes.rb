class CreateRolesParticipantes < ActiveRecord::Migration
  def change
    create_table :roles_participantes do |t|

      t.timestamps
    end
  end
end
