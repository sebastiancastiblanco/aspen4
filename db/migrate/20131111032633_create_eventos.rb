class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :title
      t.string :dsecription
      t.boolean :allDay
      t.datetime :start
      t.datetime :end
      t.string :url
      t.string :className
      t.string :color

      t.timestamps
    end
  end
end
