module Concerns::Linkable
  extend ActiveSupport::Concern

  included do
  end

  def title
    self.title
  end

  def url
    self
  end

  def link_options
    {}
  end

  class << self
    def all_linkables
      Page.all + PageGroup.all + Static.all + Upload.all
    end
  end
end
