class Role < ActiveRecord::Base
  has_many :users

  attr_accessible :name

  validates :name, :presence => true,
                   :length => { :minimum => 2, :maximum => 20 }
end
