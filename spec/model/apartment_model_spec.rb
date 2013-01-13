require 'spec_helper'

describe Apartment do
  describe "validates" do
    let(:apartment) { create(:apartment) }
    subject { apartment }

    it { should validate_presence_of(:house_id) }
    it { should have_db_index(:house_id) }
    it { should validate_numericality_of(:house_id) }
    it { should_not allow_value(0).for(:house_id) }
    it { should allow_value(1).for(:house_id) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    its(:title) { should have_at_most(50).characters }
    its(:title) { should have_at_least(4).characters }
    it { should validate_presence_of(:description) }
    its(:cost) { should be > 0 and should be < 9_999_999_999 }
    its(:space) { should be > 0 and should be < 9_999 }
    its(:number_of_rooms) { should be > 0 and should be < 99 }
    it { should_not allow_value(nil).for(:residential) }
    it { should belong_to(:house) }
    it { should have_many(:galleries) }

    xit { should accept_nested_attributes_for(:galleries).and_accept({:image=> @apartment.galleries.image}).but_reject({ :reject_if_nil => nil }) }
  end
end