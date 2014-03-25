class PageGroup < ActiveRecord::Base
  include Concerns::TransliteratedFriendlyId
  friendly_id :title, use: [:slugged, :finders]
  translates :title

  has_many :page_groups_page
  has_many :pages, through: :page_groups_page
end
