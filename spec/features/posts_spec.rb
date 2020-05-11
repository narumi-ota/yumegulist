require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  
  #ユーザーは新しいpostを作成する
  scenario "user creates a new post" do
    user = FactoryBot.create(:user)
    
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  
  expect {
    visit new_post_path
    fill_in "施設名", with: "Test Post"
    fill_in "感想", with: "Test Post"
    click_button "投稿"
    
    expect(page).to have_content "投稿が完了しました"
    expect(page).to have_content "Test Post"
  }
  end
end