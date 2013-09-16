class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :usuario_id
      t.integer :proceso_id
      t.integer :participante_id
      t.integer :contrato_id
      t.integer :actividad_id
      t.integer :alertas_id
      t.integer :estado_id
      t.integer :documento_id
      t.string :mensaje

      t.timestamps
    end
  end
end
