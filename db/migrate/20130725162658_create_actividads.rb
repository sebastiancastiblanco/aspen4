class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.string :nombre
      t.string :descripcion
      t.string :observacion
      t.date :fechaSeguimiento
      t.integer :tiempoEjecucion
      t.string :medidaTiempo

      t.timestamps
    end
  end
end
