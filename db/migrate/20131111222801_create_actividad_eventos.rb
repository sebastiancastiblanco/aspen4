class CreateActividadEventos < ActiveRecord::Migration
  def change
    create_table :actividad_eventos do |t|
      t.integer :usuario_id
      t.integer :actividad_id
      t.datetime :fecha
      t.integer :tiempo
      t.string :descripcion
      t.string :medidaTiempo

      t.timestamps
    end
  end
end
