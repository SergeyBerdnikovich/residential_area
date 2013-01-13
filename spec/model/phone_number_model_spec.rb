require 'spec_helper'

describe PhoneNumber do
  describe "validates" do
    subject { create(:phone_number) }

    it { should have_db_index(:head_id) }
    it { should have_db_index(:partner_id) }
    it { should validate_presence_of(:number) }
    its(:number) { should match /[+]{0,1}[0-9_-]{5,20}/ }
    it { should belong_to(:head) }
    it { should belong_to(:partner) }
  end
end