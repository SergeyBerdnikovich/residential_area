class PhoneNumber < ActiveRecord::Base
  belongs_to :head
  belongs_to :partner

  attr_accessible :number, :head_id, :partner_id
end
