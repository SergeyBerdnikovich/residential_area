class News < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :user_id
end
