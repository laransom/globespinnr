require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user)}
  let(:photo_1) { FactoryGirl.create(:photo) }
  let(:photo_2) { FactoryGirl.create(:photo) }
  let(:photo_3) { FactoryGirl.create(:photo) }
  let(:photo_4) { FactoryGirl.create(:photo) }
  let(:photo_5) { FactoryGirl.create(:photo) }


  it { should have_valid(:first_name).when('George', 'Pete') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Harrison', 'Townsend') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('francoise', 'user2love') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_many(:photos) }
  it { should have_many(:comments) }

  it 'returns first_name' do
    expect(user.full_name).to eq('Cyril Figgus')
  end

end
