require 'spec_helper'

describe Order, type: :model do
  before { @order = FactoryGirl.build(:order) }

  subject { @order }

  it { should respond_to(:total_price) }
  it { should respond_to(:user_id) }
  it { should respond_to(:weekday_id) }

  it { should be_valid }

  it { should belong_to(:weekday) }
  it { should belong_to(:user) }
  it { should have_many(:order_products) }
  it { should have_many(:products).through(:order_products) }
end
