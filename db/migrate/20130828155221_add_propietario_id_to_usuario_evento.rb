class AddPropietarioIdToUsuarioEvento < ActiveRecord::Migration
  def change
    add_column :usuario_eventos, :propietario_id, :integer
  end
end
