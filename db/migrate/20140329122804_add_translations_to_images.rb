class AddTranslationsToImages < ActiveRecord::Migration
  def up
    Image.create_translation_table! :title => :string
  end

  def down
    Image.drop_translation_table!
  end
end
