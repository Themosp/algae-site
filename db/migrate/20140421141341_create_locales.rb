class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :title
      t.string :code
      t.boolean :active

      t.timestamps
    end
  end
end
