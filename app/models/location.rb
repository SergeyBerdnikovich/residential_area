class Location < ActiveRecord::Base
  belongs_to :house
  belongs_to :head
  belongs_to :partner

  attr_accessible :address, :latitude, :longitude, :name, :house_id, :head_id, :partner_id, :gmaps

  validates :name, :presence => true,
                   :length => { :minimum => 3, :maximum => 20 }
  validates :address, :presence => true,
                      :length => { :minimum => 3, :maximum => 50 }
  acts_as_gmappable

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h4>#{ ERB::Util.html_escape name }</h4>" << "<h4>#{ ERB::Util.html_escape address }</h4>" <<
    if house && house.galleries.size > 0
      "<a href=\"/images/gallery/#{ house.galleries.first.id }/normal/#{ house.galleries.first.image_file_name }\">
        <img src=\"/images/gallery/#{ house.galleries.first.id }/small/#{ house.galleries.first.image_file_name }\"/>
      </a>"
    else ''
    end
  end

  def gmaps4rails_title
    "#{ERB::Util.html_escape address}"
  end

  def gmaps4rails_sidebar
    "<span class='foo'>#{ERB::Util.html_escape address}</span>"
  end
end
