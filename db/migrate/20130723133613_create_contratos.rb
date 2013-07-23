class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :tipoContrato
      t.string :objeto
      t.integer :particpante1
      t.integer :participante2
      t.float :valor
      t.string :formaPago
      t.string :obligaciones
      t.string :deberes
      t.date :fechaInicio
      t.date :fechaFin

      t.timestamps
    end
  end
end
