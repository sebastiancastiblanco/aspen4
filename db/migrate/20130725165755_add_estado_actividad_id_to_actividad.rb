class AddEstadoActividadIdToActividad < ActiveRecord::Migration
  def change
    add_column :actividads, :estadoActividad_id, :integer
  end
end
