class AddAttachmentAttachmentToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :documents, :attachment
  end
end
