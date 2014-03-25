class AddTranslationsToPageGroups < ActiveRecord::Migration
  def up
    PageGroup.create_translation_table! :title => :string
  end

  def down
    PageGroup.drop_translation_table!
  end
end
