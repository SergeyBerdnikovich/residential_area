class House < ActiveRecord::Base
  has_many :apartments, :dependent => :destroy
  has_many :galleries, :dependent => :destroy
  has_one :location, :dependent => :destroy

  accepts_nested_attributes_for :location,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :galleries,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :description, :title, :completed,
                  :location_attributes, :galleries_attributes

  validates :title, :presence => true,
                    :uniqueness => true,
                    :length => { :minimum => 4, :maximum => 50 }
  validates :description, :presence => true
  validates :completed, :inclusion => { :in => [true, false] }
  validates_associated :galleries
  validates_associated :location

  scope :get_completed, where(:completed => true)
  scope :get_uncompleted, where(:completed => false)
end
