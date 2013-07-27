class CreateRolParticipantes < ActiveRecord::Migration
  def change
    create_table :rol_participantes do |t|
      t.string :rol

      t.timestamps
    end
  end
end
