class AddemailToColega < ActiveRecord::Migration
  def change
  	add_column :colegas, :email, :string
  end
end
