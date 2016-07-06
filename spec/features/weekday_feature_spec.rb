require 'spec_helper'

feature 'User see weekdays on dashboard' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
  end

  scenario 'admin see weekdays with orders' do
    sign_in_with 'buba1@bk.ru', '123456'
    weekday_path

    expect(page).to have_content('Show Orders')
  end

  scenario 'user see weekdays without orders' do
    sign_in_with 'buba2@bk.ru', '123456'
    weekday_path

    expect(page).to have_no_content('Show Orders')
  end
end
