require 'rails_helper'

RSpec.describe User, type: :model do
  
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
  
  it "is invalid with a duplicate email adress" do 
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "Aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  describe "email validation should reject invalid addresses" do
    # 無効なメールアドレスの場合
    it "should be invalid" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end

    # 有効なメールアドレスの場合
    it "should be valid" do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  # パスワード確認が一致すること
  describe "when password doesn't match confirmation" do
    # 一致する場合
    it "is valid when password confirmation matches password" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    # 一致しない場合
    it "is invalid when password confirmation doesn't match password" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "different")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
  
  describe "authenticated? should return false for a user with nil digest" do
    # ダイジェストが存在しない場合のauthenticated?のテスト
    it "is invalid without remember_digest" do
      expect(user.authenticated?(:remember, '')).to eq false
    end
  end
end