require 'spec_helper'

describe Location do
  describe "validates" do
    subject do
      build(:location)
    end
    it { should have_db_index(:house_id) }
    it { should have_db_index(:partner_id) }
    it { should have_db_index(:head_id) }
    #it { should validate_presence_of(:name) }
    #it { should ensure_length_of(:name).is_at_least(3).is_at_most(20) }
    its(:name) { should have_at_least(3).characters }
    its(:name) { should have_at_most(20).characters }
    #it { should validate_presence_of(:address) }
    #it { should ensure_length_of(:address).is_at_least(3).is_at_most(50) }
    its(:address) { should have_at_least(3).characters }
    its(:address) { should have_at_most(50).characters }
    its(:gmaps) { should_not be_nil }
    it { should belong_to(:house) }
    it { should belong_to(:head) }
    it { should belong_to(:partner) }
  end
end