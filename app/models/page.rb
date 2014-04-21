class Page < ActiveRecord::Base
  include Concerns::Linkable

  include Concerns::TransliteratedFriendlyId
  friendly_id :title, use: [:slugged, :finders]
  translates :title, :body

  has_many :page_groups_page
  has_many :page_groups, through: :page_groups_page

  belongs_to :image
  belongs_to :back_link, polymorphic: true

  has_many :back_linked_pages, class_name: 'Page', as: :back_link

  has_many :linkables_menus

  default_scope { order(:id).includes(:translations, :image, :page_groups) }
end
