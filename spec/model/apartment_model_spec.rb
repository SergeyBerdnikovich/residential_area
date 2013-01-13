require 'spec_helper'

describe Apartment do
  describe "validates" do
    before { @apartment = create(:apartment) }

    it { should validate_presence_of(:house_id) }
    it { should have_db_index(:house_id) }
    it { should validate_numericality_of(:house_id) }
    it { should_not allow_value(0).for(:house_id) }
    it { should allow_value(1).for(:house_id) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { @apartment.title.should have_at_most(50).characters }
    it { @apartment.title.should have_at_least(4).characters }
    it { should validate_presence_of(:description) }
    it { (1..9_999_999_999).should include @apartment.cost }
    it { (1..9_999).should include @apartment.space }
    it { (1..99).should include @apartment.number_of_rooms }
    it { should_not allow_value(nil).for(:residential) }
    it { should belong_to(:house) }
    it { should have_many(:galleries) }

    xit { should accept_nested_attributes_for(:galleries).and_accept({:image=> @apartment.galleries.image}).but_reject({ :reject_if_nil => nil }) }
  end
end