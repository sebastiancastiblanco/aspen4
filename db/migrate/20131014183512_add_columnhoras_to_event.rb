class AddColumnhorasToEvent < ActiveRecord::Migration
  def change
    add_column :events, :horainicio, :datetime
    add_column :events, :horafin, :datetime
  end
end
