require 'spec_helper'

describe Comment do

  it { should have_valid(:body).when('Something') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

end
