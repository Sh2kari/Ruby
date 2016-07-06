require 'spec_helper'

describe SocialProfile, type: :model do
  before { @social_profile = FactoryGirl.build(:social_profile) }

  subject { @social_profile }

  it { should respond_to(:user_id) }
  it { should respond_to(:uid) }
  it { should respond_to(:service_name) }

  it { should be_valid }

  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:service_name) }
  it { should validate_uniqueness_of(:service_name).scoped_to(:user_id) }

  it { should belong_to(:user) }
end
