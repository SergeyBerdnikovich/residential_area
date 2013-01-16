# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::ApartmentsController do
  render_views

  let(:apartment) { create(:apartment) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'current path should be admin_roles_path' do

      visit edit_admin_apartment_path(apartment)
      find_field('Название')
      find_field('Описание')
      fill_in('Цена', :with => 32000)
      fill_in('Площадь', :with => 144)
      fill_in('Кол. комнат', :with => 3)
      uncheck('Жилое помещение')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Update Apartment')

      current_path.should == admin_apartment_path(apartment)
    end
  end

  describe "GET 'new'" do
    it 'current path should be admin_roles_path' do

      visit new_admin_apartment_path
      fill_in('Название', :with => 'pizza papizza')
      fill_in('Описание', :with => 'дешёвая пицца')
      fill_in('Цена', :with => 32000)
      fill_in('Площадь', :with => 144)
      fill_in('Кол. комнат', :with => 3)
      check('Жилое помещение')
      attach_file('Image', "#{Rails.root}/app/assets/images/rails.png")
      click_button('Create Apartment')

      current_path.should == admin_apartments_path
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