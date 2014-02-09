class AddColumnAbogadosToTables < ActiveRecord::Migration
  def change
    add_column :alerta, :abogado_id, :integer
    add_column :actividad_eventos, :abogado_id, :integer
    add_column :control_accesos, :abogado_id, :integer
    add_column :documents, :abogado_id, :integer
    add_column :logs, :abogado_id, :integer
    
  end
end
