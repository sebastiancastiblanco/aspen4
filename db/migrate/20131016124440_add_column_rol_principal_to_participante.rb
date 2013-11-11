class AddColumnRolPrincipalToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :rolPrincipal, :boolean
  end
end
