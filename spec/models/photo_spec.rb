require 'spec_helper'

describe Photo do
 it { should have_valid(:location).when('France', 'New York') }
 it { should_not have_valid(:location).when(nil, '') }
end
