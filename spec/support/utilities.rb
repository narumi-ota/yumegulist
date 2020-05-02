
  def sign_in_as(user)
    post login_path, params: { session: { email: user.email,
                                      password: user.password } }
  end
  
  def valid_login(user)
    visit root_path
    click_link "ログイン"
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
  end