class ChangeFechaSeguimientoTypeInActividad < ActiveRecord::Migration
  def up
  	change_table :actividads do |t|
      t.change :fechaSeguimiento, :datetime
    end
  end

  def down
  	change_table :actividads do |t|
      t.change :fechaSeguimiento, :date
    end
  end
end
