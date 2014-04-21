class CreateUploadFileAttachment < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|
      t.references :upload
      t.string     :style
      t.binary     :file_contents
    end

    add_index :file_attachments, :upload_id
  end
end
