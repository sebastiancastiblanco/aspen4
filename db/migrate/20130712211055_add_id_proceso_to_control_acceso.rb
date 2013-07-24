class AddIdProcesoToControlAcceso < ActiveRecord::Migration
  def change
    add_column :control_accesos, :proceso_id, :integer
  end
end
