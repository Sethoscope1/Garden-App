class AddAttachmentNotePhotoToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :note_photo
    end
  end

  def self.down
    drop_attached_file :notes, :note_photo
  end
end
