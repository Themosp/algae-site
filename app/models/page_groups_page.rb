class PageGroupsPage < ActiveRecord::Base
  belongs_to :page
  belongs_to :page_group

  default_scope { order(:order) }
end
