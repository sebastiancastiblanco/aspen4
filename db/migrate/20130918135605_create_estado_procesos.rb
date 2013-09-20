class CreateEstadoProcesos < ActiveRecord::Migration
  def change
    create_table :estado_procesos do |t|
      t.string :estado

      t.timestamps
    end
  end
end
