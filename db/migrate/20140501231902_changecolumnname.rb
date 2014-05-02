class Changecolumnname < ActiveRecord::Migration
  def change
     add_column :abogados, :failed_attempts, :integer, default: 0
  end

end
