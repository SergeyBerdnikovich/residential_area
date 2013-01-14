require 'spec_helper'

describe Gallery do
  describe "validates" do
    subject { create(:gallery) }

    it { should validate_presence_of(:image) }
    it { should ensure_inclusion_of(:image_content_type).in_array(%w!image/jpg image/jpeg image/gif image/png!) }
    its(:image_file_size) { should be > 0 and should be < 2_000 }
    it { should belong_to(:house) }
    it { should belong_to(:apartment) }
  end
end