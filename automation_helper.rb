require 'watir-webdriver'
require 'headless'

# Contains helper methods that can be used from various automation tests
module AutomationHelper
  def initialize_browser
    # Headless.new.start
    @browser = Watir::Browser.new
    # IMPORTANT. Without this, watir can't see login link in headless mode
    # (As it becomes a menu in smaller screen sizes)
    @browser.window.resize_to(1024, 768)
    # TODO: pick from configuration
    @base_url = "http://damp-sands-8561.herokuapp.com/"
  end


  #Function for Login
  def login(user, password)
    @browser.goto(@base_url)
    @browser.text_field(:id, "user_email").set user
    @browser.text_field(:id, "user_password").set password
    @browser.input(:type, "submit").click
    sleep 10
  end


  #Function for default login
  def default_login
    login("rohitsjce@gmail.com","codetheoryio")
  end
end