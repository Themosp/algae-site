class AddTranslationsToUploads < ActiveRecord::Migration
  def change
    Upload.create_translation_table! :title => :string
  end
end
