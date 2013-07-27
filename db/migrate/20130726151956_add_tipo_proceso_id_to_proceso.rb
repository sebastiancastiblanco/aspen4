class AddTipoProcesoIdToProceso < ActiveRecord::Migration
  def change
    add_column :procesos, :tipo_proceso_id, :integer
  end
end
