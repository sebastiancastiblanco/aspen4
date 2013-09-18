class AddColumnprocesoidToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :proceso_id, :integer
  end
end
