require 'spec_helper'

describe House do
  describe "validates" do
    subject { create(:house) }

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(4).is_at_most(50) }
    it { should validate_presence_of(:description) }
    it { should_not allow_value(nil).for(:completed) }
    it { should have_one(:location) }
    it { should have_many(:galleries) }
    it { should accept_nested_attributes_for(:galleries) }
    it { should accept_nested_attributes_for(:location) }
  end
end