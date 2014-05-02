class AddActivoToAbogado < ActiveRecord::Migration
  def change
    add_column :abogados, :activo, :boolean
  end
end
