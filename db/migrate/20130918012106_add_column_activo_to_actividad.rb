class AddColumnActivoToActividad < ActiveRecord::Migration
  def change
    add_column :actividads, :activo, :boolean
  end
end
