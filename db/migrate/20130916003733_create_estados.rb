class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :tipo
      t.date :fecha
      t.string :resumen
      t.string :conclusion

      t.timestamps
    end
  end
end
