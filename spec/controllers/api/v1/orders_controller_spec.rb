require 'spec_helper'

describe Api::V1::OrdersController, type: :controller do

  before :each do
    @user = FactoryGirl.create :user
    @user.add_role(:admin)
  end

  describe "GET index" do
    it 'returns a successful 200 response' do
      get :index, auth_token: @user.authentication_token, format: 'json'
      expect(response).to have_http_status(:ok)
    end

    it 'returns an authorized 401 response' do
      get :index, auth_token: 'qwerty', format: 'json'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
