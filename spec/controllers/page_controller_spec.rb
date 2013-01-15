require 'spec_helper'

describe PagesController do
  describe "GET 'developer'" do
    it "should be success" do
      get :developer
      response.should be_success
    end
  end

  describe "GET 'files'" do
    it "should be success" do
      get :files
      response.should be_success
    end
  end

  describe "GET 'welcome'" do
    it "should be success" do
      get :welcome
      response.should be_success
    end
  end
end