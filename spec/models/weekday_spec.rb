require 'spec_helper'

describe Weekday, type: :model do
  before { @weekday = FactoryGirl.build(:weekday) }

  subject { @weekday }

  it { should respond_to(:title) }
  it { should respond_to(:date) }

  it { should be_valid }

  it { should validate_presence_of(:title) }

  it { should have_many(:products) }
  it { should have_many(:orders) }

  describe "#products association" do

    before do
      @weekday.save
      3.times { FactoryGirl.create :product, weekday: @weekday }
    end

    it "destroys the associated orders on self destruct" do
      products = @weekday.products
      @weekday.destroy
      products.each do |product|
        expect(Product.find(product)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
