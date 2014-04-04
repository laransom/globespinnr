FactoryGirl.define do

  factory :photo do
    image File.open('spec/features/waterfall.jpg')
    description 'A beautiful waterfall'
    location 'Peru'
  end

end
