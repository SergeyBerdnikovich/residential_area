require 'spec_helper'

describe ApartmentsController do
  before do
    create(:house)
    create(:apartment)
  end

  describe "GET 'index'" do
    it "should be success" do
      get :index, { :house_id => 1 }
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be success" do
      get :show, { :house_id => 1, :id => 1 }
      response.should be_success
    end
  end
end