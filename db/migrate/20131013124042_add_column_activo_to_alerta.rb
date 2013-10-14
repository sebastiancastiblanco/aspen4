class AddColumnActivoToAlerta < ActiveRecord::Migration
  def change
    add_column :alerta, :activo, :boolean
  end
end
