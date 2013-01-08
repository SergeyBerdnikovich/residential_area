class Head < ActiveRecord::Base
  has_many :phone_numbers, :dependent => :destroy
  has_one :location, :dependent => :destroy

  accepts_nested_attributes_for :phone_numbers, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :location, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :full_name, :position, :phone_numbers_attributes, :location_attributes

  validates :full_name, :presence => true,
                        :length => { :minimum => 10, :maximum => 50 }
  validates :position, :presence => true,
                        :length => { :minimum => 3, :maximum => 50 }
  validates_associated :phone_numbers
  validates_associated :location
end
