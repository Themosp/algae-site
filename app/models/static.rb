class Static < ActiveRecord::Base
  translates :title

  has_many :linkables_menus
  has_many :linkables, through: :linkables_menus

  def to_param
    action
  end
end
