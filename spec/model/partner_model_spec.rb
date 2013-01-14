require 'spec_helper'

describe Partner do
  describe "validates" do
    subject { create(:partner) }

    it { should validate_presence_of(:title) }
    its(:title) { should have_at_most(50).characters }
    its(:title) { should have_at_least(2).characters }
    it { should validate_presence_of(:description) }
    its(:description) { should have_at_most(50).characters }
    its(:description) { should have_at_least(4).characters }
    it { should have_many(:phone_numbers) }
    it { should have_one(:location) }
    it { should accept_nested_attributes_for(:phone_numbers).and_accept({ :number=> '123456' })
                                                            .but_reject({ :reject_if_nil => nil }) }
    xit { should accept_nested_attributes_for(:location).and_accept({ :address=> 'Rafieva 40, Minsk',
                                                                     :name => 'dom' })
                                                       .but_reject({ :reject_if_nil => nil }) }
  end
end