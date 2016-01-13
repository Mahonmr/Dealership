require('Capybara/rspec')
require('./app')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dealership addition path", {:type => :feature}) do
  it('it adds a dealership to the dealership list') do
    visit('/dealerships/new')
    fill_in "name", :with => "Bob"
    click_button("Add Dealership")
    expect(page).to have_content("Success")
  end
end
