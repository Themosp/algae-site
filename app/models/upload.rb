class Upload < ActiveRecord::Base
  include Concerns::Linkable

  translates :title

  has_attached_file :file_attachment
  validates_attachment_content_type :file_attachment, :content_type => /.*/

  default_scope { order(:id).includes(:translations) }

  def url
    file_attachment.url
  end

  def link_options
    { target: '_blank' }
  end
end
