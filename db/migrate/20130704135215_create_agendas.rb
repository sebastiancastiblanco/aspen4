class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :titulo

      t.timestamps
    end
  end
end
