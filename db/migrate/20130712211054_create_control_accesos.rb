class CreateControlAccesos < ActiveRecord::Migration
  def change
    create_table :control_accesos do |t|
      t.integer :controlAcceso_id

      t.timestamps
    end
  end
end
