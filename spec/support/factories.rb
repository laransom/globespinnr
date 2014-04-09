FactoryGirl.define do

  factory :photo do
    image File.open('spec/features/waterfall.jpg')
    description 'A beautiful waterfall'
    location 'Peru'
  end

  factory :user do
    first_name 'Cyril'
    last_name 'Figgus'
    username 'El contador'
    email 'troller@isis.com'
    password 'password'
    password_confirmation 'password'
  end

end
