FactoryGirl.define do

  factory :photo do
    image File.open('spec/features/waterfall.jpg')
    description 'A beautiful waterfall'
    location
    user
  end

  factory :user do
    first_name 'Cyril'
    last_name 'Figgus'
    sequence :username do |u|
      'El contador#{u}'
    end
    sequence :email do |e|
      'troller#{e}@isis.com'
    end
    password 'password'
    password_confirmation 'password'
  end

  factory :location do
    name 'France'
  end

end
