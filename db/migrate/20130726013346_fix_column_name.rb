class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :actividads, :estadoActividad_id, :estado_actividad_id
  end
end