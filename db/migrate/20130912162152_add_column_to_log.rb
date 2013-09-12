class AddColumnToLog < ActiveRecord::Migration
  def change
    add_column :logs, :mensaje_id, :integer
  end
end
