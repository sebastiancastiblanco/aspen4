class AddUsuarioIdToTipoProceso < ActiveRecord::Migration
  def change
    add_column :tipo_procesos, :usuario_id, :integer
  end
end
