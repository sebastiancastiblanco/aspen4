class AddColumnActivoToProceso < ActiveRecord::Migration
  def change
    add_column :procesos, :activo, :boolean
  end
end
