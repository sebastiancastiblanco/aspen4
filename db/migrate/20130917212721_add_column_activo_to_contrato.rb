class AddColumnActivoToContrato < ActiveRecord::Migration
  def change
    add_column :contratos, :activo, :boolean
  end
end
