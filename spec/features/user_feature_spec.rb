require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign up')
  end

  scenario 'with invalid password confirmation' do
    sign_up_with_invalid_password 'valid@example.com', 'password', 'invalid_password'

    expect(page).to have_content('Sign up')
  end
end

feature 'User signs in' do

  before (:each) do
    @user = FactoryGirl.create(:user, email: 'buba@bk.ru', password: '123456', password_confirmation: '123456')
  end

  scenario 'with valid email and password' do
    sign_in_with 'buba@bk.ru', '123456'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', '123456'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'with invalid password' do
    sign_in_with 'buba@bk.ru', '12345678'

    expect(page).to have_content('Invalid Email or password.')
  end
end

feature 'User edit profile' do

  before (:each) do
    @user = FactoryGirl.create(:user, email: 'buba@bk.ru', password: '123456', password_confirmation: '123456')
  end

  scenario 'update profile data with valid params' do
    sign_in_with 'buba@bk.ru', '123456'
    edit_with 'buba@bk.ru', '123456', 'Shikari'

    expect(page).to have_content('Profile was successfully updated')
  end

  scenario 'update profile data with invalid password' do
    sign_in_with 'buba@bk.ru', '123456'
    edit_with_invalid_params 'buba@bk.ru', '123456', '12345678', 'Shikari'

    expect(page).to have_content("Password confirmationdoesn't match Password")
  end

  scenario 'update profile data without first name' do
    sign_in_with 'buba@bk.ru', '123456'
    edit_without_first_name 'buba@bk.ru', '123456'

    expect(page).to have_content("First namecan't be blank")
  end
end

feature 'User sign out' do

  before (:each) do
    @user = FactoryGirl.create(:user, email: 'buba@bk.ru', password: '123456', password_confirmation: '123456')
  end

  scenario 'and redirects to root path' do
    sign_in_with 'buba@bk.ru', '123456'
    sign_out

    expect(page).to have_content('Signed out successfully.')
  end
end

feature 'User see users' do

  before (:each) do
    @user = FactoryGirl.create(:user, :admin, email: 'buba1@bk.ru', password: '123456', password_confirmation: '123456')
    @user = FactoryGirl.create(:user, email: 'buba2@bk.ru', password: '123456', password_confirmation: '123456')
    @weekday = FactoryGirl.create(:weekday)
  end

  scenario 'admin see all users' do
    sign_in_with 'buba1@bk.ru', '123456'
    user_profile_path

    expect(page).to have_content('Listing Users')
  end

  scenario 'user can not see all users' do
    sign_in_with 'buba2@bk.ru', '123456'

    expect{weekday_order_path}.to raise_error(CanCan::AccessDenied)
  end
end
