class AddProcesoIdToAlerta < ActiveRecord::Migration
  def change
    add_column :alerta, :proceso_id, :integer
  end
end
