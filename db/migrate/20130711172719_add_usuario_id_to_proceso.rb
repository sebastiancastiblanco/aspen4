class AddUsuarioIdToProceso < ActiveRecord::Migration
  def change
    add_column :procesos, :usuario_id, :integer
  end
end
