# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe "user_sing_in_admin_panel" do

  before do
    create(:user, :name => 'admin')
  end
  it "Guest can not enter in the admin panel" do

    login_as create(:user, :name => 'guest')
    visit admin_users_path

    current_path.should == root_path
  end

  it "Unauthorized user can not enter in the admin panel" do

    visit admin_users_path

    current_path.should == root_path
  end
end