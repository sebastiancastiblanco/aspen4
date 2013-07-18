class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.string :tipoDocumento
      t.integer :documento
      t.string :nombre
      t.string :apellido
      t.string :estadoCivil
      t.string :genero
      t.string :direccion
      t.integer :telefono
      t.integer :celular
      t.string :correo
      t.date :fechaNacimiento

      t.timestamps
    end
  end
end
