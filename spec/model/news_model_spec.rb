require 'spec_helper'

describe News do
  describe "validates" do
    subject { create(:news) }

    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(5) }
    it { should validate_uniqueness_of(:content) }
    it { should validate_presence_of(:content) }
    it { should validate_numericality_of(:user_id) }
    it { should validate_presence_of(:user_id) }
    it { should belong_to(:user) }
    its(:content) { should_not == News.sanitize_news(subject) }
  end
end