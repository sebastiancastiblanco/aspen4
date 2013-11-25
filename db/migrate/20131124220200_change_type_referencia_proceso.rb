class ChangeTypeReferenciaProceso < ActiveRecord::Migration
  def up
  	change_table :procesos do |t|
      t.change :referencia, :string
    end
  end

  def down
  	change_table :procesos do |t|
      t.change :referencia, :float
    end
  end
end
