class AddColumnIdUsuarioToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :usuario_id, :integer
  end
end
