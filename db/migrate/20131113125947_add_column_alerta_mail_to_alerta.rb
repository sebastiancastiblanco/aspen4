class AddColumnAlertaMailToAlerta < ActiveRecord::Migration
  def change
    add_column :alerta, :notificarMail, :boolean
  end
end
