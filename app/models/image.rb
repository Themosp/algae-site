class Image < ActiveRecord::Base
  translates :title

  has_attached_file :image_attachment
  validates_attachment_content_type :image_attachment, :content_type => /\Aimage\/.*\Z/

  has_many :pages

  def position_for_small_style
    if position_for_small.present?
      "background-position: #{position_for_small}px"
    else
      'background-position: center'
    end
  end

  def position_for_very_small_style
    if position_for_very_small.present?
      "background-position: #{position_for_very_small}px"
    else
      'background-position: center'
    end
  end
end
