require 'spec_helper'

feature 'user ends session', %q{
  As a signed in user
  I want to sign out
  so I can leave the site securely
} do

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'user signs out' do
      click_link 'Sign Out'
      expect(page).to have_content('Sign In')
    end
  end
end
