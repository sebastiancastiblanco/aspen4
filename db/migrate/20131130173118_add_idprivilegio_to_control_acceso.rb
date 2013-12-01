class AddIdprivilegioToControlAcceso < ActiveRecord::Migration
  def change
    add_column :control_accesos, :privilegio_id, :integer
  end
end
