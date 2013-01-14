require 'spec_helper'

describe Head do
  describe "validates" do
    subject { create(:head) }

    it { should validate_presence_of(:full_name) }
    it { should ensure_length_of(:full_name).is_at_least(10).is_at_most(50) }
    it { should validate_presence_of(:position) }
    it { should ensure_length_of(:position).is_at_least(3).is_at_most(50) }
    it { should have_many(:phone_numbers) }
    it { should have_one(:location) }
    it { should accept_nested_attributes_for(:phone_numbers) }
    it { should accept_nested_attributes_for(:location) }
  end
end