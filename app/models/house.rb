class House < ActiveRecord::Base
  has_many :apartments, :dependent => :destroy
  attr_accessible :description, :title, :completed

   scope :get_completed_houses, where(:completed => true)
   scope :get_uncompleted_houses, where(:completed => false)
end
