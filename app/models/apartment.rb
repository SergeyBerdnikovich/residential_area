class Apartment < ActiveRecord::Base
  belongs_to :house
  has_many :galleries, :dependent => :destroy

  attr_accessible :cost, :description, :number_of_rooms, :residential, :space, :title
end
