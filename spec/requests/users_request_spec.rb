require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET #new" do
    
    it "returns http success" do
      get new_user_url
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #show" do
    let(:takashi) { FactoryBot.create :takashi }
      
    it "responds successfully" do
      get user_url takashi.id
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #index" do
    before do
      FactoryBot.create :takashi
      FactoryBot.create :satoshi
    end
    
    it 'responds successfully' do
      get users_url
      expect(response.status).to eq 200
    end

    it 'user name exist' do
      get users_url
      expect(response.body).to include "Takashi"
      expect(response.body).to include "Satoshi"
    end
  end
  
  describe 'GET #edit' do
    let(:takashi) { FactoryBot.create :takashi }

    it 'リクエストが成功すること' do
      get :edit, params: { id: takashi }
      expect(response.status).to eq 200
    end

    it 'editテンプレートで表示されること' do
      get :edit, params: { id: takashi }
      expect(response).to render_template :edit
    end
  end
end