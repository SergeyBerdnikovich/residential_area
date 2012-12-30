class House < ActiveRecord::Base
  has_many :apartments, :dependent => :destroy
  has_many :galleries, :dependent => :destroy
  has_one :location, :dependent => :destroy

  accepts_nested_attributes_for :location, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :galleries, :allow_destroy => :true,
   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :description, :title, :completed,
                  :location_attributes, :galleries_attributes

  scope :get_completed_houses, where(:completed => true)
  scope :get_uncompleted_houses, where(:completed => false)
end
