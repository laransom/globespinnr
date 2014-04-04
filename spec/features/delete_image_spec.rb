require 'spec_helper'

feature 'delete photo from globespinnr', %q{
  As a authorized user
  I want to be able to delete a photo I uploaded
  So that it won't be visible to other users
} do
  scenario 'delete photo' do
    photo = FactoryGirl.create(:photo)
    photo_count = Photo.count
    visit photos_path
    click_on 'a'
    click_on 'Delete Photo'

    expect(Photo.count).to eq(photo_count -1)
  end
end