class Apartment < ActiveRecord::Base
  belongs_to :house
  has_many :galleries, :dependent => :destroy

  accepts_nested_attributes_for :galleries, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :cost, :description, :number_of_rooms,
                  :residential, :space, :title, :house_id, :galleries_attributes

  scope :get_not_residential_apartments, where(:residential => false)
  scope :get_residential_apartments, where(:residential => true)
end
