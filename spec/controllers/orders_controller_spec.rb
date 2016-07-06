require 'spec_helper'

describe OrdersController, type: :controller do

  before :each do
    @user = FactoryGirl.create :user
    @user.add_role(:admin)
    sign_in @user
  end

  let!(:order) { FactoryGirl.create :order }

  describe "GET index" do
    it 'assigns @orders' do
      get :index, weekday_id: order.weekday_id
      expect(assigns(:orders)).to eq([order])
    end

    it "renders the index template" do
      get :index, weekday_id: order.weekday_id
      expect(response).to render_template("index")
    end
  end

  describe 'GET new' do
    it 'assigns a new order as @order' do
      get :new, weekday_id: order.weekday_id
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it 'creates a new product' do
        expect{
          post :create, weekday_id: order.weekday_id, order: {  user_id: order.user_id }
        }.to change(Order, :count).by(1)
      end

      it "redirects to the root_path when save" do
        post :create, weekday_id: order.weekday_id, order: {  user_id: order.user_id }
        expect(response).to redirect_to root_path
      end
    end
  end
end

