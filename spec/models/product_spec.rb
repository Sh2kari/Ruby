require 'spec_helper'

describe Product, type: :model do
  before { @product = FactoryGirl.build(:product) }

  subject { @product }

  it { should respond_to(:weekday_id) }
  it { should respond_to(:category_id) }
  it { should respond_to(:title) }
  it { should respond_to(:price) }

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }

  it { should belong_to(:weekday) }
  it { should belong_to(:category) }
  it { should have_many(:order_products) }
end
