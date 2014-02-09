class AddColumnAbogadosToTables2 < ActiveRecord::Migration
  def change
  	add_column :procesos, :abogado_id, :integer
  end
end
