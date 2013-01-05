class Location < ActiveRecord::Base
  belongs_to :house
  belongs_to :head
  belongs_to :partner

  attr_accessible :address, :latitude, :longitude, :name, :house_id, :head_id, :partner_id, :gmaps

  acts_as_gmappable

  def gmaps4rails_address
    address
  end
  def gmaps4rails_infowindow
    "<h4>#{ ERB::Util.html_escape name }</h4>" << "<h4>#{ ERB::Util.html_escape address }</h4>" <<
    if house
      "<a href=\"/images/gallery/#{ house.galleries.first.id }/normal/#{ house.galleries.first.image_file_name }\">
        <img src=\"/images/gallery/#{ house.galleries.first.id }/small/#{ house.galleries.first.image_file_name }\"/>
      </a>" unless house.galleries.blank?
    else ''
    end
  end
  def gmaps4rails_title
    "#{ERB::Util.html_escape address}"
  end
#  def gmaps4rails_marker_picture
#    {
#     "picture" => ActionController::Base.helpers.asset_path('rails.png'),
#     #"picture" => "/public/rails.png",
#     #"picture" => "#{Rails.root}/public/images/rails.png",
#     #"picture" => "/home/at0m/Projects/residential_area/public/rails.png",
#     "width" => 50,
#     "height" => 50,
#     "marker_anchor" => [5, 10],
#    "shadow_picture" => "/images/rails.png",
#     "shadow_width" => 50,
#     "shadow_height" => 50,
#    "shadow_anchor" => [5, 10],
#   }
#  end
  def gmaps4rails_sidebar
    "<span class='foo'>#{ERB::Util.json_escape address}</span>"
  end
end
