class AddLinksToMenus < ActiveRecord::Migration
  def change
    create_table :linkables_menus do |t|
      t.integer :order
      t.integer :depth

      t.references :linkable, :polymorphic => true
      t.references :menu

      t.timestamps
    end
  end
end
