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
    click_link "新規投稿"
    fill_in "施設名", with: "Test Place"
    select "中央区", from: "場所"
    fill_in "感想", with: "Test Post"
    click_button "投稿"
    
    expect(page).to have_content "投稿が完了しました"
    expect(page).to have_content "Test Place"
    expect(page).to have_content "中央区"
    expect(page).to have_content "Test Post"
  }
  
  end
end