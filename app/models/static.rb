class Static < ActiveRecord::Base
  include Concerns::Linkable

  translates :title

  has_many :linkables_menus
  has_many :linkables, through: :linkables_menus

  default_scope { order(:action) }

  def url
    [ action ]
  end
end
