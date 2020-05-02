require 'rails_helper'
require 'support/utilities'

RSpec.describe "Remember me", type: :request do
  let(:user) { FactoryBot.create(:user) }
  
  # remember_meチェックボックスのテスト
  context "login with remembering" do
    it "remembers cookies" do
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      expect(response.cookies['remember_token']).to_not eq nil
    end
  end

  context "login without remembering" do
    it "doesn't remember cookies"do
      # クッキーを保存してログイン
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      delete logout_path
      # クッキーを保存せずにログイン
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '0'} }
      expect(response.cookies['remember_token']).to eq nil
    end
  end
end