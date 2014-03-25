# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 I18n.with_locale 'el' do
   require File.expand_path('../seeds/cms_pages', __FILE__)
   require File.expand_path('../seeds/cms_page_groups', __FILE__)
 end
 require File.expand_path('../seeds/cms_page_groups_pages', __FILE__)
