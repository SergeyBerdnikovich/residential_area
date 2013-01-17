require 'spec_helper'
include Warden::Test::Helpers

describe Admin::RolesController do
  render_views

  before do
    login_as create(:user)
    @role = create(:role)
  end

  describe "GET 'index'" do
    it 'page should have content "Roles"' do

      visit admin_roles_path

      page.should have_content("Roles")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Role Details"' do

      create(:user, :name => 'Vasya')
      visit admin_role_path(@role)

      page.should have_content("#{@role.name}")
    end
  end
end