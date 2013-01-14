require 'spec_helper'

describe PhoneNumber do
  describe "validates" do
    subject { create(:phone_number) }

    it { should have_db_index(:head_id) }
    it { should have_db_index(:partner_id) }
    it { should validate_presence_of(:number) }
    it { should ensure_length_of(:number).is_at_least(5).is_at_most(20) }
    it { should belong_to(:head) }
    it { should belong_to(:partner) }
  end
end