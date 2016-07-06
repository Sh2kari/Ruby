module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_up_with_invalid_password(email, password, invalid_password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: invalid_password
      click_button 'Sign up'
    end

    def sign_in_with(email, password)
      visit user_session_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end

    def edit_with(email, password, first_name)
      visit edit_users_profile_path(@user)
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      fill_in 'First name', with: first_name
      click_button 'Save'
    end

    def edit_with_invalid_params(email, password, invalid_password, first_name)
      visit edit_users_profile_path(@user)
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: invalid_password
      fill_in 'First name', with: first_name
      click_button 'Save'
    end

    def edit_without_first_name(email, password)
      visit edit_users_profile_path(@user)
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Save'
    end

    def sign_out
      page.find(:xpath, "//a[@href='/users/sign_out']").click
    end

    def weekday_path
      visit weekdays_path
    end

    def new_product_path
      visit new_weekday_product_path(@weekday)
    end

    def create_product(title, price)
      visit new_weekday_product_path(@weekday)
      select('First course', from: 'Category')
      fill_in 'Title', with: title
      fill_in 'Price', with: price
      click_button 'Create Product'
    end

    def weekday_order_path
      visit weekday_orders_path(@weekday)
    end

    def create_order
      visit new_weekday_order_path(@weekday)
      click_button 'Create Order'
    end

    def user_profile_path
      visit users_profile_index_path
    end
  end
end
