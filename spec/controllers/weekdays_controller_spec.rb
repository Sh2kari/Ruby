require 'spec_helper'

describe WeekdaysController, type: :controller do

  before :each do
    @user = FactoryGirl.create :user
    @user.add_role(:admin)
    sign_in @user
  end

  let!(:weekday) { FactoryGirl.create :weekday }

  describe "GET index" do

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new weekday" do
        expect{
          post :create, weekday: { title: weekday.title }
        }.to change(Weekday,:count).by(1)
      end

      it "redirects to the root_path when save" do
        post :create, weekday: { title: weekday.title }
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new weekday" do
        expect{
          post :create, weekday: { title: nil }
        }.to_not change(Weekday,:count)
      end

      it "redirects to the root_path when do not save" do
        post :create, weekday: { title: nil }
        expect(response).to redirect_to root_path
      end
    end
  end
end
