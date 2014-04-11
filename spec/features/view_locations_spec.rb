require 'spec_helper'

feature 'user can view locations and associated photos', %q{
  As a registered or unregistered user
  I want to view different locales and their associated photos
  So that I can virtually tour the world
} do

  scenario 'views a specific locale' do
    FactoryGirl.create(:location)
    visit root_path
    select 'France', from: 'country'
    click_on 'Go'

    expect(page).to have_content 'France'
  end

end
