require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  background do
    ActionMailer::Base.deliveries.clear
  end

  scenario '新規ユーザを登録する' do
    visit root_path
    expect(page).to have_http_status :ok

    click_link 'サインアップ'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    expect { click_button 'Sign up' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address'

    user = User.last
    token = user.confirmation_token
    visit user_confirmation_path(confirmation_token: token)
    expect(page).to have_content 'Your email address has been successfully confirmed'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
