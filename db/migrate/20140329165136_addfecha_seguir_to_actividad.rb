class AddfechaSeguirToActividad < ActiveRecord::Migration
 def change
  	add_column :actividads, :fechaseguir, :datetime
  end
end
