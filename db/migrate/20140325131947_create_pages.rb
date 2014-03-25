class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :title_link
      t.text :body
      t.string :image
      t.boolean :big_image
      t.integer :image_position
      t.string :image_link
      t.string :slug

      t.timestamps
    end

    add_index :pages, :slug, unique: true
  end
end
