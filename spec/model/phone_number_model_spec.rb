require 'spec_helper'

describe PhoneNumber do
  describe "validates" do
    before { @phone_number = create(:phone_number) }

    it { should have_db_index(:head_id) }
    it { should have_db_index(:partner_id) }
    it { should validate_presence_of(:number) }
    it { (5..20).should include @phone_number.number.to_s.size }
    it { should belong_to(:head) }
    it { should belong_to(:partner) }
  end
end