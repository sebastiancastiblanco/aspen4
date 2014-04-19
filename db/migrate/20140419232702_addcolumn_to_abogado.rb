class AddcolumnToAbogado < ActiveRecord::Migration
  def up
  	add_column :abogados, :nombre, :string
  	add_column :abogados, :empresa, :string
  end

  def down
  end
end
