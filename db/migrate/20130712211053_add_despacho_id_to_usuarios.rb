class AddDespachoIdToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :despacho_id, :integer
  end
end
