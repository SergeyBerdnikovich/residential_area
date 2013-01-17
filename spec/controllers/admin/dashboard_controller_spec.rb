# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::DashboardController do
  render_views

  before do
    login_as create(:user)
  end
  describe "GET 'index'" do
    it 'page should have content "Users"' do

      visit admin_dashboard_path

      page.should have_content("Dashboard")
    end
  end
end