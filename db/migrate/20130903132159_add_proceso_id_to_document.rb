class AddProcesoIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :proceso_id, :integer
  end
end
