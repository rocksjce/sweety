require 'watir-webdriver'
describe 'login' do
  it "should work with proper email and password" do
    default_login
    expect(@browser.text).not_to include("Ooops!")
    expect(@browser.text).to include("Hello")
    expect(@browser.text).to include("Signed in successfully")
  end

  it "should not work with wrong password" do
    login("rohitsjce@gmail.com", "ricky")
    expect(@browser.url).not_to include("/home")
    expect(@browser.text).to include("Invalid email or password.")
  end
end