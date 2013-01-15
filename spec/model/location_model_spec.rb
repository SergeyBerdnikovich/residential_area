require 'spec_helper'

describe Location do
  describe "validates" do
    subject do
      build(:location)
    end
    it { should have_db_index(:house_id) }
    it { should have_db_index(:partner_id) }
    it { should have_db_index(:head_id) }
    its(:gmaps) { should_not be_nil }
    it { should belong_to(:house) }
    it { should belong_to(:head) }
    it { should belong_to(:partner) }
    it 'name should be present', :vcr do
      should validate_presence_of(:name)
    end
    it 'name length should be at least 3 and at most 20', :vcr do
      should ensure_length_of(:name).is_at_least(3).is_at_most(20)
    end
    it 'address should be present(should not be nil)' do
      subject.address.should_not be_nil
    end
    it 'address length should be at least 3 and at most 20', :vcr do
      should ensure_length_of(:address).is_at_least(3).is_at_most(50)
    end
  end
end