require 'spec_helper'

feature 'Admin creates product' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
    @user = FactoryGirl.create(:user, email: 'buba2@bk.ru', password: '123456', password_confirmation: '123456')
    @weekday = FactoryGirl.create(:weekday)
  end

  scenario 'with valid params' do
    sign_in_with 'buba1@bk.ru', '123456'
    create_product 'Banana', '22'

    expect(page).to have_content('Product was created.')
    expect(page).to have_content('Banana')
  end

  scenario 'with invalid title' do
    sign_in_with 'buba1@bk.ru', '123456'
    create_product '', '33'

    expect(page).to have_content("Titlecan't be blank")
  end

  scenario 'with invalid price' do
    sign_in_with 'buba1@bk.ru', '123456'
    create_product 'orange', ''

    expect(page).to have_content("Pricecan't be blank")
  end
end


feature 'User creates product' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
    @user = FactoryGirl.create(:user, email: 'buba2@bk.ru', password: '123456', password_confirmation: '123456')
    @weekday = FactoryGirl.create(:weekday)
  end

  scenario 'can not get page' do
    sign_in_with 'buba2@bk.ru', '123456'

    expect{new_product_path}.to raise_error(CanCan::AccessDenied)
  end
end

