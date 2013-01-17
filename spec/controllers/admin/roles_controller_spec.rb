require 'spec_helper'
include Warden::Test::Helpers

describe Admin::RolesController do
  let(:role) { create(:role) }
  before do
    login_as create(:user)
  end

  describe "GET 'index'" do
    it 'current path should be admin_roles_path' do
      visit admin_roles_path
      current_path.should == admin_roles_path
    end
  end

  describe "GET 'show'" do
    it 'current path should be admin_roles_path(role)' do
      visit admin_role_path(role)
      current_path.should == admin_role_path(role)
    end
  end
end