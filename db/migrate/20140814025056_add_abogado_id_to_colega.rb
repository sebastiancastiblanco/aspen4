class AddAbogadoIdToColega < ActiveRecord::Migration
    def change
  	add_column :colegas, :abogado_id, :integer
  end
end
