class CreateAlerta < ActiveRecord::Migration
  def change
    create_table :alerta do |t|
      t.string :titulo
      t.string :hora
      t.string :nota
      t.datetime :comienza
      t.datetime :termina
      t.integer :repeticion

      t.timestamps
    end
  end
end
