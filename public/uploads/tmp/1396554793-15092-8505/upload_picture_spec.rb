require 'spec_helper'

feature 'Upload picture to globespinnr', %q{
  As any user
  I should be able to post pictures to the site
  So that they will appear to all site visitors
} do
  scenario 'User uploads a picture with valid attributes' do
    visit new_photo_path

    file_path = 'spec/features/waterfall.jpg'
    attach_file('photo_image', file_path)
    fill_in 'Description', with: 'Snowflake'
    fill_in 'Location', with: 'Ivory Coast'
    click_on 'Add Photo'

    expect(page).to have_content 'Snowflake'
    expect(page).to have_content 'Photo successfully added'

  end

  scenario 'User uploads photo without location' do
    visit new_photo_path

    click_on 'Add Photo'

    expect(page).to have_content 'Upload unsuccessful'
    expect(page).to have_content "can't be blank"
  end
end
