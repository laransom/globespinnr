require 'spec_helper'

describe Location do
  it { should have_valid(:name).when('France') }
  it { should_not have_valid(:name).when(nil, '')}

end
