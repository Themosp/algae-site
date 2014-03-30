class AddFileAttachmentColumnsToUploads < ActiveRecord::Migration
  def change
    add_attachment :uploads, :file_attachment
  end
end
