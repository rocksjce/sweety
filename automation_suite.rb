require 'rspec'


load "automation_helper.rb"
include AutomationHelper

RSpec.configure do |config|
  config.before(:each) { initialize_browser }
  config.after(:each) { @browser.close unless @browser.nil? }
end


TEST_SCRIPTS = ["login"]
TEST_SCRIPTS.each { |script| load "#{script}.rb" }