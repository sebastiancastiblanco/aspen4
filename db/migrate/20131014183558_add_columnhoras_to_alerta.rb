class AddColumnhorasToAlerta < ActiveRecord::Migration
  def change
    add_column :alerta, :horainicio, :datetime
  end
end
