require 'spec_helper'

feature 'Upload picture to globespinnr', %q{
  As an authinticated user
  I should be able to post pictures to a specific location
  So that it will appear on that locations page
} do

  context 'as an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }
    let(:location) { FactoryGirl.create(:location) }

    before :each do
      sign_in_as(user)
    end

    scenario 'User uploads a picture with valid attributes' do
      pre_count = Photo.count
      visit location_path(location)

      click_on 'Add Photo'

      file_path = 'spec/features/waterfall.jpg'
      attach_file('photo_image', file_path)
      fill_in 'Description', with: 'Snowflake'
      click_on 'Add Photo'
      save_and_open_page


      expect(page).to have_content 'Photo successfully added'
      expect(Photo.count).to eq(pre_count + 1)

    end

    scenario 'User uploads photo without location' do
      pre_count = Photo.count
      visit location_path(location)

      click_on 'Add Photo'

      click_on 'Add Photo'

      expect(page).to have_content 'Upload unsuccessful'
      expect(Photo.count).to eq(pre_count)
    end
  end
end
