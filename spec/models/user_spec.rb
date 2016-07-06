require 'spec_helper'

describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:organization_id) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authentication_token) }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_confirmation_of(:password) }

  it { should belong_to(:organization) }
  it { should have_one(:profile) }
  it { should have_many(:social_profiles) }
  it { should have_many(:orders) }

  it { should accept_nested_attributes_for(:profile) }

  it { should delegate_method(:first_name).to(:profile) }
  it { should delegate_method(:last_name).to(:profile) }

  it "should approve correct roles" do
    @user.add_role :user
    expect(@user.has_role?(:user)).to be true
  end

  it "should not approve incorrect roles" do
    @user.add_role :user
    expect(@user.has_role?(:admin)).to be false
  end

  describe "#orders association" do

    before do
      @user.save
      3.times { FactoryGirl.create :order, user: @user }
    end

    it "destroys the associated orders on self destruct" do
      orders = @user.orders
      @user.destroy
      orders.each do |order|
        expect(Order.find(order)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
