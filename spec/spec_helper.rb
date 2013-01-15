require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'database_cleaner'
  require 'capybara/rspec'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|

    config.include Devise::TestHelpers, :type => :controller

    config.order = "random"

    config.include FactoryGirl::Syntax::Methods

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/admin/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'
    add_group 'Libraries', 'lib'
    add_group 'Plugins', 'vendor/plugins'
  end

  FactoryGirl.reload
  Dir["#{Rails.root}/app/**/*.rb"].each {|file| load file }
  load "#{Rails.root}/config/routes.rb"
end
