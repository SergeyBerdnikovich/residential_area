class Partner < ActiveRecord::Base
  has_many :phone_numbers, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  attr_accessible :description, :title, :phone_numbers_attributes
end