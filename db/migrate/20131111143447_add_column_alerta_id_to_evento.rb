class AddColumnAlertaIdToEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :alerta_id, :int
  end
end
