class AddColumnActividadMailToActividad < ActiveRecord::Migration
  def change
    add_column :actividads, :notificarMail, :boolean
  end
end
