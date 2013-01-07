class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :role_id
  # attr_accessible :title, :body
  belongs_to :role

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