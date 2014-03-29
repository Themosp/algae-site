class CreateImageImageData < ActiveRecord::Migration
  def change
    create_table :image_attachments do |t|
      t.references :image
      t.string     :style
      t.binary     :file_contents
    end

    add_index :image_attachments, :image_id
  end
end
