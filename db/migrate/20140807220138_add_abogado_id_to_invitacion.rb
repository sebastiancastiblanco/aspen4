class AddAbogadoIdToInvitacion < ActiveRecord::Migration
  def change
  	add_column :invitacions, :abogado_id, :integer
  end
end
