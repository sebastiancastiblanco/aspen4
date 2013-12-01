class CreatePrivilegios < ActiveRecord::Migration
  def change
    create_table :privilegios do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
