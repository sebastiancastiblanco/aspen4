class AddColumnEventoidToUsuarioEvento < ActiveRecord::Migration
  def change
    add_column :usuario_eventos, :evento_id, :int
  end
end
