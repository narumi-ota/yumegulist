require 'rails_helper'

RSpec.describe User, type: :model do
  
  #バリデーションが有効か
  describe 'Are validation effective?' do
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).
      is_at_most(50)
    }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).
      is_at_most(255)
    }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).
      is_at_least(6)
    }
  end
  
  #Factorybotの正常性確認
  describe 'factor bot' do
    it 'has valid factory' do
      expect (FactoryBot.build(:user)).to be_valid
    end
  end

  #重複したメールアドレスは無効
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end