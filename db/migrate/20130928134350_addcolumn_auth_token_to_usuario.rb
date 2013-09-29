class AddcolumnAuthTokenToUsuario < ActiveRecord::Migration
 def change
    add_column :usuarios, :authToken, :string
  end
end
