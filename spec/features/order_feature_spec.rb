require 'spec_helper'

feature 'Admin and orders' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
    @user = FactoryGirl.create(:user, email: 'buba2@bk.ru', password: '123456', password_confirmation: '123456')
    @weekday = FactoryGirl.create(:weekday)
  end

  scenario 'admin see orders for weekday' do
    sign_in_with 'buba1@bk.ru', '123456'
    weekday_order_path

    expect(page).to have_content('Listing Orders')
  end
end


feature 'User and orders' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
    @user = FactoryGirl.create(:user, email: 'buba2@bk.ru', password: '123456', password_confirmation: '123456')
    @weekday = FactoryGirl.create(:weekday)
  end

  scenario 'user can not see orders for weekday' do
    sign_in_with 'buba2@bk.ru', '123456'

    expect{weekday_order_path}.to raise_error(CanCan::AccessDenied)
  end

  scenario 'user creates order' do
    sign_in_with 'buba2@bk.ru', '123456'
    create_order

    expect(page).to have_content('Order was created.')
  end
end
