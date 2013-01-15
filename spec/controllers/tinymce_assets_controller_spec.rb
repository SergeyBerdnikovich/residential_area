require 'spec_helper'

describe TinymceAssetsController do
  before do
    Gallery.stub!(:create! => create(:gallery))
  end

  describe "POST 'create'" do
    it "should be success" do
      post :create
      response.should be_success
    end
  end
end