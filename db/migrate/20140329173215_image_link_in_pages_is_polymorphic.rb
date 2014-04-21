class ImageLinkInPagesIsPolymorphic < ActiveRecord::Migration
  def change
    add_column :pages, :back_link_id, :integer
    add_column :pages, :back_link_type, :string

    remove_column :pages, :image_link
  end
end
