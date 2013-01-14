require 'spec_helper'

describe User do
  before do
   create(:role, :name => 'guest')
   create(:role, :name => 'admin')
   @user = create(:user)
   create(:user, :name => 'Sasha')
  end
  describe 'validates' do
    it { should have_db_index(:role_id) }
    it { should have_db_index(:email) }
    it { should validate_presence_of(:name) }
    it { @user.name.should have_at_most(20).characters }
    it { @user.name.should have_at_least(2).characters }
    it { should belong_to(:role) }
  end
  describe 'role methods' do
    it "method 'role?' return true if user role is admin" do
      User.first.role?(:admin).should be true
    end
    it 'first user role is admin' do
      User.first.role.name.should == 'admin'
    end
    it 'second user role is guest' do
      User.last.role.name.should == 'guest'
    end
  end
end