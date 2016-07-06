require 'spec_helper'

describe Organization, type: :model do
  before { @organization = FactoryGirl.build(:organization) }

  subject { @organization }

  it { should respond_to(:name) }

  it { should be_valid }

  it { should validate_presence_of(:name) }

  it { should have_many(:users) }

  describe "#organizations association" do

    before do
      @organization.save
      3.times { FactoryGirl.create :user, organization: @organization }
    end

    it "destroys the associated organizations on self destruct" do
      users = @organization.users
      @organization.destroy
      users.each do |user|
        expect(User.find(user)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
