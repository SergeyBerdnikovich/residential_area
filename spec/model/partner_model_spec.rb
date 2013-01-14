require 'spec_helper'

describe Partner do
  describe "validates" do
    subject { create(:partner) }

    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(50) }
    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(4).is_at_most(50) }
    it { should have_many(:phone_numbers) }
    it { should have_one(:location) }
    it { should accept_nested_attributes_for(:phone_numbers) }
    it { should accept_nested_attributes_for(:location) }
  end
end