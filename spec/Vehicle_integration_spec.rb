require('Capybara/rspec')
require('./app')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the vehicle addition path", {:type => :feature}) do
  it('adds a vehicle to the vehicle list') do
    test_dealership = Dealership.new("Test_Dealer")
    test_dealership.save()
    visit("/dealerships/#{test_dealership.id}/vehicles/new")
    fill_in "make", :with => "Subaru"
    fill_in "model", :with => "Outback"
    fill_in "year", :with => "2012"
    click_button("Add Vehicle")
    expect(page).to have_content("Success")
  end
end
