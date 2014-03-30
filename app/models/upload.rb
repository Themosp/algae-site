class Upload < ActiveRecord::Base
  translates :title

  has_attached_file :file_attachment
  validates_attachment_content_type :file_attachment, :content_type => /.*/
end
