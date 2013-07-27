class CreateProcesoParticipantes < ActiveRecord::Migration
  def change
    create_table :proceso_participantes do |t|
      t.integer :participante_id
      t.integer :proceso_id

      t.timestamps
    end
  end
end
