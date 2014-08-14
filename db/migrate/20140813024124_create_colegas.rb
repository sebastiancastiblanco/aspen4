class CreateColegas < ActiveRecord::Migration
  def change
    create_table :colegas do |t|
      t.integer :abogado1
      t.integer :abogado2
      t.boolean :activo

      t.timestamps
    end
  end
end
