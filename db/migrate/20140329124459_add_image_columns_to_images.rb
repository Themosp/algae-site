class AddImageColumnsToImages < ActiveRecord::Migration
  def change
    add_attachment :images, :image_attachment
  end
end
