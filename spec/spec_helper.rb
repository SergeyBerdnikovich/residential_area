require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'database_cleaner'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|

    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = false

    config.infer_base_class_for_anonymous_controllers = false

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

 # Use: it { should accept_nested_attributes_for(:association_name).and_accept({valid_values => true}).but_reject({ :reject_if_nil => nil })}

RSpec::Matchers.define :accept_nested_attributes_for do |association|
  match do |model|
    @model = model
    @nested_att_present = model.respond_to?("#{association}_attributes=".to_sym)
    if @nested_att_present && @reject
      model.send("#{association}_attributes=".to_sym,[@reject])
      @reject_success = model.send("#{association}").empty?
    end
    model.send("#{association}").clear
    if @nested_att_present && @accept
      model.send("#{association}_attributes=".to_sym,[@accept])
      @accept_success = ! (model.send("#{association}").empty?)
    end
    @nested_att_present && ( @reject.nil? || @reject_success ) && ( @accept.nil? || @accept_success )
  end

  failure_message_for_should do
    messages = []
    messages << "accept nested attributes for #{association}" unless @nested_att_present
    messages << "reject values #{@reject.inspect} for association #{association}" unless @reject_success
    messages << "accept values #{@accept.inspect} for association #{association}" unless @accept_success
    "expected #{@model.class} to " + messages.join(", ")
  end

  description do
    desc = "accept nested attributes for #{expected}"
    if @reject
      desc << ", but reject if attributes are #{@reject.inspect}"
    end
  end
  chain :but_reject do |reject|
    @reject = reject
  end
  chain :and_accept do |accept|
    @accept = accept
  end
end