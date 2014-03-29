class LinkablesMenu < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true
  belongs_to :menu

  default_scope { order(:order) }
end
