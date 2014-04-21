class PagesReferenceImages < ActiveRecord::Migration
  def change
    remove_column :pages, :image
    remove_column :pages, :image_position

    add_column :pages, :image_id, :integer, references: :images
  end
end
