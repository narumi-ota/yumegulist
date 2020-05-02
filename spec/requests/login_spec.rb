require 'rails_helper'
require 'support/utilities'

RSpec.feature "Login", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  # ログインに成功する
  describe "user successfully login" do
    
    it "should login successfully" do
      valid_login(user)
      expect(current_path).to eq user_path(user)
      expect(page).to_not have_content "ログイン"
      
      # ログアウトのテスト
      click_link "ログアウト"
      expect(current_path).to eq root_path
      expect(page).to have_content "ログイン"
    end
  end

  # 無効な情報ではログインに失敗する
  describe "user doesn't login with invalid information" do
    
    it "should not login successfully with valid information" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      click_button "ログイン"
  
      expect(current_path).to eq login_path
      expect(page).to have_content "ログイン"
      expect(page).to have_content "メールアドレスまたはパスワードが正しくありません"
    end
  end
end