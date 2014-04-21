class CreatePageGroupsPages < ActiveRecord::Migration
  def change
    create_table :page_groups_pages do |t|
      t.integer :order

      t.references :page_group
      t.references :page
    end

    add_index :page_groups_pages, [:page_group_id, :page_id]
    add_index :page_groups_pages, :page_id
  end
end
