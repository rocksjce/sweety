require 'watir-webdriver'

describe "Blood Glucose level " do

  before  :each do
    @entry_level = 2
  end

  it "blood level entry functionality should work properly" do
    default_login
    @browser.a(:href, "/entries").click
    sleep 5
    @browser.a(:class, "btn btn-primary").click
    sleep 5
    @browser.text_field(:id, "entry_level").set @entry_level
    @browser.button(:class, "btn btn-default").click
    sleep 5
    value_of_glucose_level_after_entry = @browser.table(:class, "table table-striped").tbody.tr.td.text.tr('[a-z][/]', "").to_i
    expect(@entry_level).to equal(value_of_glucose_level_after_entry)
  end


end