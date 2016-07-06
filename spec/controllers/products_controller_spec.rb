require 'spec_helper'

describe ProductsController, type: :controller do

  before :each do
    @user = FactoryGirl.create :user
    @user.add_role(:admin)
    sign_in @user
  end

  let!(:product) { FactoryGirl.create :product }

  describe 'GET new' do
    it 'assigns a new product as @product' do
      get :new, weekday_id: product.weekday_id
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it 'creates a new product' do
        expect{
          post :create, weekday_id: product.weekday_id, product: {  title: product.title, price: product.price }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the root_path when save" do
        post :create, weekday_id: product.weekday_id, product: {  title: product.title, price: product.price }
        expect(response).to redirect_to new_weekday_order_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new weekday" do
        expect{
          post :create, weekday_id: product.weekday_id, product: {  title: nil }
        }.to_not change(Weekday, :count)
      end

      it "render new template when do not save" do
        post :create, weekday_id: product.weekday_id, product: {  title: nil }
        expect(response).to render_template(:new)
      end
    end
  end
end
