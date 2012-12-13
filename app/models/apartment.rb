class Apartment < ActiveRecord::Base
  belongs_to :house
  attr_accessible :cost, :description, :number_of_rooms, :residential, :space, :title
end
