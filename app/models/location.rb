class Location < ActiveRecord::Base
  belongs_to :house
  belongs_to :head
  belongs_to :partner

  attr_accessible :address, :latitude, :longitude, :name, :house_id, :head_id, :partner_id, :gmaps

  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => { :minimum => 3, :maximum => 20 }
  validates :address, :presence => true,
                      :length => { :minimum => 3, :maximum => 50 }
  validates :gmaps, :inclusion => { :in => [true, false] }

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

  def gmaps4rails_sidebar
    "<span class='foo'>#{ERB::Util.html_escape address}</span>"
  end

  def self.update_location(params_obj, obj)
    temp_location = self.create!(:address => params_obj[:location_attributes][:address],
                                 :name => params_obj[:location_attributes][:name])
    if obj.location
      obj.location.update_attributes(:address => temp_location.address,
                                     :longitude => temp_location.longitude,
                                     :latitude => temp_location.latitude,
                                     :name => temp_location.name)
      temp_location.destroy
    else
      obj.location = temp_location
    end
  end
end
