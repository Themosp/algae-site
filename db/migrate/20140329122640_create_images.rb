class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :position_for_small
      t.integer :position_for_very_small

      t.timestamps
    end
  end
end
