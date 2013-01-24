class Apartment < ActiveRecord::Base
  belongs_to :house
  has_many :galleries, :dependent => :destroy

  accepts_nested_attributes_for :galleries,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :cost, :description, :number_of_rooms,
                  :residential, :space, :title, :house_id, :galleries_attributes

  validates :title, :presence => true,
                    :uniqueness => true,
                    :length => { :minimum => 4, :maximum => 50 }
  validates :description, :presence => true
  validates :cost, :numericality => { :greater_than => 0 },
                   :length => { :maximum => 10 }
  validates :space, :numericality => { :greater_than => 0 },
                   :length => { :maximum => 4 }
  validates :number_of_rooms, :numericality => { :greater_than => 0 },
                   :length => { :maximum => 2 }
  validates :house_id, :presence => true,
                       :numericality => { :greater_than => 0 }
  validates :residential, :inclusion => { :in => [true, false] }
  validates_associated :galleries

  scope :get_not_residential, where(:residential => false)
  scope :get_residential, where(:residential => true)
  scope :for, ->(house) { where('house_id = ?', house) }
end
