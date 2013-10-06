class AddProcesoIdToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :proceso_id, :integer
  end
end
