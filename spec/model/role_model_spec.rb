require 'spec_helper'

describe Role do
  describe "validates" do
    before { @role = create(:role) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { (2..20).should include @role.name.size }
    it { should have_many(:users) }
  end
end