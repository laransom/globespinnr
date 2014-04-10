require 'spec_helper'

feature 'user signs in', %q{
  As a registered user
  I want to sign in
  so that I can submit and review site content
} do

  scenario 'user specifies valid and required information' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content('Sign Out')
  end

  scenario 'invalid information returns errors' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'badpass'

    click_on 'Sign in'

    expect(page).to_not have_content('Signed in successfully')
    expect(page).to have_content('Invalid email or password')
  end

end
