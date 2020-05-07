require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET #new" do
    
    it "returns http success" do
      get new_user_url
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #show" do
    let(:user) { FactoryBot.create :user }
      
    it "responds successfully" do
      get user_url user.id
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #index" do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'responds successfully' do
      valid_login @user
      get users_path
      expect(response).to be_success
    end
  end
  
  describe 'GET #edit' do
    before do
      @user = FactoryBot.create(:user)
    end

    #リクエストが成功すること
    it 'responds successfully' do
      valid_login @user
      visit edit_user_url @user.id
      expect(response.status).to eq 200
    end

    #editテンプレートで表示されること
    it 'return edit template' do
      get edit_user_url @user.id
      expect(response).to render_template :edit
    end
  end
end