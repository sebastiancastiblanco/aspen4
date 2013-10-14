class AddColumnActivoToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :activo, :boolean
  end
end
