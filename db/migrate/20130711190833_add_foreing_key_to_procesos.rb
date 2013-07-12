class AddForeingKeyToProcesos < ActiveRecord::Migration
  def change
  	add_index :procesos, :usuario_id
  end
end
