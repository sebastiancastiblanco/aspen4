class AddColumneventousuario < ActiveRecord::Migration
  def change
    add_column :usuario_eventos, :abogado_id, :integer
  end
end
