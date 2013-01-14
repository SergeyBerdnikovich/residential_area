require 'spec_helper'

describe Head do
  describe "validates" do
    subject { create(:head) }

    it { should validate_presence_of(:full_name) }
    its(:full_name) { should have_at_most(50).characters }
    its(:full_name) { should have_at_least(10).characters }
    it { should validate_presence_of(:position) }
    its(:position) { should have_at_most(50).characters }
    its(:position) { should have_at_least(3).characters }
    it { should have_many(:phone_numbers) }
    it { should have_one(:location) }
    it { should accept_nested_attributes_for(:phone_numbers).and_accept({ :number=> '123456' })
                                                            .but_reject({ :reject_if_nil => nil }) }
    xit { should accept_nested_attributes_for(:location).and_accept({ :address=> 'Rafieva 40, Minsk',
                                                                     :name => 'dom' })
                                                       .but_reject({ :reject_if_nil => nil }) }
  end
end