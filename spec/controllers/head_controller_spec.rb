require 'spec_helper'

describe HeadsController do
  before do
    create(:head)
  end

  describe "GET 'show'" do
    it "should be success" do
      get :show, { :id => 1 }
      response.should be_success
    end
  end
end