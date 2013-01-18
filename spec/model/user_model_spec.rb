require 'spec_helper'

describe User do
  before do
    @first_user = create(:user)
    @second_user = create(:user)
  end

  describe 'validates' do
    it { should have_db_index(:role_id) }
    it { should have_db_index(:email) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(20) }
    it { should belong_to(:role) }
  end

  describe 'role methods' do
    it "method 'role?' return true if user role is admin" do
      @first_user.role?(:admin).should be true
    end

    it 'first user role is admin' do
      @first_user.role.name.should == 'admin'
    end

    it 'second user role is guest' do
      @second_user.role.name.should == 'guest'
    end
  end
end