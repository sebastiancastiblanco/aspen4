class FixColumnType < ActiveRecord::Migration
  def change
    change_column :usuarios, :username, :string, :null => true
  end
end
