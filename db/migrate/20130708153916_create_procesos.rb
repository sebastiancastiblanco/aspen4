class CreateProcesos < ActiveRecord::Migration
  def change
    create_table :procesos do |t|
      t.float :referencia
      t.float :procesoHomologado
      t.string :resumen
      t.string :ciudad
      t.string :objetivo
      t.string :titulo
      t.boolean :favorito

      t.timestamps
    end
  end
end
