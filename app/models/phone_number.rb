class PhoneNumber < ActiveRecord::Base
  belongs_to :heads
  belongs_to :partners
  attr_accessible :number
end
