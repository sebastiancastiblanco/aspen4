class AddColumnestadoprocesoToProceso < ActiveRecord::Migration
  def change
    add_column :procesos, :estado_proceso_id, :integer
  end
end
