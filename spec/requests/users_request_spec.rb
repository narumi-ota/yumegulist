require 'rails_helper'
require 'support/utilities.rb'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET #new" do
    
    it "returns http success" do
      get signup_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
  
  describe "GET #show" do

    # ログイン済みのユーザーとして
    context "as an authenticated user" do
      # 正常なレスポンスを返すこと
      it "responds successfully" do
        sign_in_as user
        get user_path(user)
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end

    # ログインしていないユーザーの場合
    context "as a guest" do 
      # ログイン画面にリダイレクトすること
      it "redirects to the login page" do
        get user_path(user)
        expect(response).to redirect_to login_path
      end
    end

    # アカウントが違うユーザーの場合
    context "as other user" do 
      before do
        @other_user = FactoryBot.create(:user)
      end

      # ホーム画面にリダイレクトすること
      it "redirects to the login page" do
        sign_in_as @other_user
        get user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end
end