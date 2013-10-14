class AddColumnActivoToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :activo, :boolean
  end
end
