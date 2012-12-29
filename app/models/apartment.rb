class Apartment < ActiveRecord::Base
  belongs_to :house
  has_many :galleries, :dependent => :destroy

  attr_accessible :cost, :description, :number_of_rooms, :residential, :space, :title, :house_id

  scope :get_not_residential_apartments, where(:residential => false)
end
