class AddProcesoIdToContrato < ActiveRecord::Migration
  def change
    add_column :contratos, :proceso_id, :integer
  end
end
