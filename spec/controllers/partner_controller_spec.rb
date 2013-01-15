require 'spec_helper'

describe PartnersController do
  before do
    create(:partner)
  end

  describe "GET 'show'" do
    it "should be success" do
      get :show, { :id => 1 }
      response.should be_success
    end
  end
end