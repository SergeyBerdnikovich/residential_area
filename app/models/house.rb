class House < ActiveRecord::Base
  has_many :apartments
  attr_accessible :description, :title
end
