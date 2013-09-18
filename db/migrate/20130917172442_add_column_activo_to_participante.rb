class AddColumnActivoToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :activo, :boolean
  end
end
