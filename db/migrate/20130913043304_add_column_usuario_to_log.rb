class AddColumnUsuarioToLog < ActiveRecord::Migration
  def change
    add_column :logs, :usuario, :string
  end
end
