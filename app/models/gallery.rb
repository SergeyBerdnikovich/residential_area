class Gallery < ActiveRecord::Base
  belongs_to :house
  belongs_to :apartment

  has_attached_file :image, :styles => { :small => "50x50>", :normal => "700x700>" },
                    :url  => "/images/gallery/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/gallery/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']

  attr_accessible :house_id, :apartment_id, :image

  scope :get_gallery_for_house, ->(house_id) { where('house_id = ?', house_id) }
  scope :get_gallery_for_apartment, ->(apartment_id) { where('apartment_id = ?', apartment_id) }
end
