class User < ActiveRecord::Base
  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :role_id

  validates :name, :presence => true,
                   :length => { :minimum => 2, :maximum => 20 }

  before_create :define_role

  def role?(role)
    self.role && self.role.name == role.to_s
  end

  private

  def define_role
    if User.first
      self.role = Role.find_or_create_by_name('guest')
    else
      self.role = Role.find_or_create_by_name('admin')
    end
  end
end