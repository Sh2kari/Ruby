require 'spec_helper'

describe Profile, type: :model do
  before { @profile = FactoryGirl.build(:profile) }

  subject { @profile }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }

  it { should be_valid }

  it { should validate_presence_of(:first_name) }

  it { should belong_to(:user) }
end
