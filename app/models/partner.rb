class Partner < ActiveRecord::Base
  has_many :phone_numbers, :dependent => :destroy
  has_one :location, :dependent => :destroy

  accepts_nested_attributes_for :phone_numbers,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :location,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :description, :title, :phone_numbers_attributes, :location_attributes

  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 50 }
  validates :description, :presence => true,
                          :length => { :minimum => 4, :maximum => 50 }
  validates_associated :phone_numbers
  validates_associated :location
end