require 'spec_helper'

describe User do
  it { should have_valid(:first_name).when('George', 'Pete') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Harrison', 'Townsend') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('francoise', 'user2love') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_many(:photos) }
  it { should have_many(:comments) }
end
