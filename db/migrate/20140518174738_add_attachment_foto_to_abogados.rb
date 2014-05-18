class AddAttachmentFotoToAbogados < ActiveRecord::Migration
  def self.up
    change_table :abogados do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :abogados, :foto
  end
end
