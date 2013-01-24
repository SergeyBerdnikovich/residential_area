class Gallery < ActiveRecord::Base
  belongs_to :house
  belongs_to :apartment

  has_attached_file :image,
                    :styles => { :small => "50x50>",
                                 :for_gallery => "200x200>",
                                 :normal => "700x700>" },
                    :url  => "/images/gallery/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/gallery/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']

  attr_accessible :house_id, :apartment_id, :image, :for_carousel

  scope :for_house, ->(house) { where('house_id = ?', house) }
  scope :for_apartment, ->(apartment) { where('apartment_id = ?', apartment) }
  scope :for_news, where(:house_id => nil).where(:apartment_id => nil).where(:for_carousel => false)
  scope :for_carousel, where(:for_carousel => true)
end
