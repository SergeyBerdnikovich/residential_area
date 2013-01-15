require 'spec_helper'

describe NewsController do
  before do
    create(:news)
  end

  describe "GET 'index'" do
    it "should be success" do
      get :index
      response.should be_success
    end
  end
end