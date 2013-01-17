# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::HousesController do
  render_views

  let(:house) { create(:house) }
  let(:apartment) { create(:apartment) }
  let(:location) { create(:location) }
  let(:gallery) { create(:gallery) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page(without location, gallery) should have content "House was successfully updated"', :vcr do

      visit edit_admin_house_path(house)
      fill_in('Название', :with => 'Дом XXL')
      fill_in('Описание', :with => '25-этажный дом')
      check('Построен')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      fill_in('Name', :with => 'Дом XXL')
      fill_in('Address', :with => 'Колоса 27, Минск')
      click_button('Update House')

      page.should have_content("House was successfully updated")
    end

    it 'page(with location, gallery) should have content "House was successfully updated"', :vcr do

      house.location = location
      house.galleries << gallery
      visit edit_admin_house_path(house)
      fill_in('Название', :with => 'Дом XXL')
      fill_in('Описание', :with => '25-этажный дом')
      check('Построен')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      fill_in('Name', :with => 'Дом XXL')
      fill_in('Address', :with => 'Колоса 27, Минск')
      click_button('Update House')

      page.should have_content("House was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "House was successfully created"', :vcr do

      visit new_admin_house_path
      fill_in('Название', :with => 'Дом XXL')
      fill_in('Описание', :with => '25-этажный дом')
      check('Построен')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      fill_in('Name', :with => 'Дом XXL')
      fill_in('Address', :with => 'Колоса 27, Минск')
      click_button('Create House')

      page.should have_content("House was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page(with apartments) should have content "House Details"' do

      house.apartments << apartment
      visit admin_house_path(house)

      page.should have_content("House Details")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Houses"' do

      house
      visit admin_houses_path

      page.should have_content("Houses")
    end
  end
end