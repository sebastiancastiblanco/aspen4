class AddColumnProcesoUsuarioToLog < ActiveRecord::Migration
  def change
    add_column :logs, :proceso, :string
  end
end
