class CreateUsuarioEventos < ActiveRecord::Migration
  def change
    create_table :usuario_eventos do |t|
      t.integer :usuario_id
      t.integer :event_id

      t.timestamps
    end
  end
end
