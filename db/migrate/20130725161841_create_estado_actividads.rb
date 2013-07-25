class CreateEstadoActividads < ActiveRecord::Migration
  def change
    create_table :estado_actividads do |t|
      t.string :estado

      t.timestamps
    end
  end
end
