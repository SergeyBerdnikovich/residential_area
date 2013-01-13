class PhoneNumber < ActiveRecord::Base
  belongs_to :head
  belongs_to :partner

  attr_accessible :number, :head_id, :partner_id

  validates :number, :presence => true,
                     :length => { :minimum => 5, :maximum => 20 },
                     :format => /[+]{0,1}[0-9_-]{5,20}/
end
