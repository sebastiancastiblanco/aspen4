class CreateSoftwareAbogados < ActiveRecord::Migration
  def change
    create_table :software_abogados do |t|
      t.string :correo
      t.string :nombre

      t.timestamps
    end
  end
end
