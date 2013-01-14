require 'spec_helper'

describe Role do
  describe "validates" do
    subject { create(:role) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(20) }
    it { should have_many(:users) }
  end
end