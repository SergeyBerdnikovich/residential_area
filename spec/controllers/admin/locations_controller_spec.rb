# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::LocationsController do
  render_views

  let(:location) { create(:location) }
  let(:house) { create(:house) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page should have content "Location was successfully updated"', :vcr do

      house
      visit edit_admin_location_path(location)
      select(house.title, :from => 'location_house_id')
      select(nil, :from => 'location_head_id')
      select(nil, :from => 'location_partner_id')
      fill_in('Address', :with => 'Беды 4, Минск')
      fill_in('Name', :with => 'какое то место')
      fill_in('Longitude', :with => 32.423423)
      fill_in('Latitude', :with => 14.42342)
      check('Gmaps')
      click_button('Update Location')

      page.should have_content("Location was successfully updated")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Location Details"', :vcr do

      visit admin_location_path(location)

      page.should have_content("Location Details")
    end
  end
end