class AddTranslationsToStatics < ActiveRecord::Migration
  def change
    Static.create_translation_table! :title => :string
  end
end
