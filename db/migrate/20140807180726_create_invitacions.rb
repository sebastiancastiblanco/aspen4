class CreateInvitacions < ActiveRecord::Migration
  def change
    create_table :invitacions do |t|
      t.integer :abogado1
      t.string :tomail
      t.boolean :aceptado

      t.timestamps
    end
  end
end
