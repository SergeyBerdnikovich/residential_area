#encoding: utf-8
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ResidentialArea::Application.initialize!

Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d в %k:%M:%S"
Time::DATE_FORMATS[:date] = "%v"
Time::DATE_FORMATS[:time] = "%T"
Time::DATE_FORMATS[:for_news] = "%m/%d/%y в %k:%M"