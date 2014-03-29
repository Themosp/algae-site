class PageGroup < ActiveRecord::Base
  include Concerns::TransliteratedFriendlyId
  friendly_id :title, use: [:slugged, :finders]
  translates :title

  has_many :page_groups_page
  has_many :pages, through: :page_groups_page

  has_many :back_linked_pages, class_name: 'Page', as: :back_link
end
