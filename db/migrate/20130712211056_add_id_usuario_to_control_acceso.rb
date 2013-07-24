class AddIdUsuarioToControlAcceso < ActiveRecord::Migration
  def change
    add_column :control_accesos, :usuario_id, :integer
  end
end
