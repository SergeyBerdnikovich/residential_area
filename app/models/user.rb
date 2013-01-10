class User < ActiveRecord::Base
  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :role_id

  validates :name, :presence => true,
                   :length => { :minimum => 2, :maximum => 20 }

  after_create :define_role

  def role?(role)
    self.role && self.role.name == role.to_s
  end

  private

  def define_role
    if User.all.size > 1
      Role.find_by_name('guest').users << User.last
    else
      Role.find_by_name('admin').users << User.first
    end
  end
end