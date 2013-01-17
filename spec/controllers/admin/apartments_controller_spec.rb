# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::ApartmentsController do
  render_views

  let(:apartment) { create(:apartment) }
  let(:house) { create(:house) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page should have content "Apartment was successfully updated"' do

      house
      visit edit_admin_apartment_path(apartment)
      select(house.title, :from => 'apartment_house_id')
      find_field('Название')
      find_field('Описание')
      fill_in('Цена', :with => 32000)
      fill_in('Площадь', :with => 144)
      fill_in('Кол. комнат', :with => 3)
      uncheck('Жилое помещение')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Apartment')

      page.should have_content("Apartment was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Apartment was successfully created"' do

      house
      visit new_admin_apartment_path
      select(house.title, :from => 'apartment_house_id')
      fill_in('Название', :with => 'pizza papizza')
      fill_in('Описание', :with => 'дешёвая пицца')
      fill_in('Цена', :with => 32000)
      fill_in('Площадь', :with => 144)
      fill_in('Кол. комнат', :with => 3)
      check('Жилое помещение')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Create Apartment')

      page.should have_content("Apartment was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'current path should be admin_apartment_path(apartment)' do

      visit admin_apartment_path(apartment)
      page.should have_content("Apartment Details")

      current_path.should == admin_apartment_path(apartment)
    end
  end
end