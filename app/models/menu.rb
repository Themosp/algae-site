class Menu < ActiveRecord::Base
  has_many :linkables_menus

  accepts_nested_attributes_for :linkables_menus,
                                reject_if: proc { |attributes| attributes[:linkable_type].blank? || attributes[:linkable_id].blank? },
                                allow_destroy: true
end
