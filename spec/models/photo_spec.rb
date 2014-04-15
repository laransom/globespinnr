require 'spec_helper'

describe Photo do

  it { should belong_to(:user) }
  it { should belong_to(:location) }

end
