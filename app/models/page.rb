class Page < ActiveRecord::Base
  include Concerns::TransliteratedFriendlyId
  friendly_id :title, use: [:slugged, :finders]
  translates :title, :body

  has_many :page_groups_page
  has_many :page_groups, through: :page_groups_page

  belongs_to :image
end
