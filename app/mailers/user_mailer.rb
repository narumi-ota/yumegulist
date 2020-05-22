class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント有効化:yumegulist"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワードリセット:yumegulist"
  end
end