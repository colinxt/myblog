def sign_in(user)
  visit jinqu_path
  fill_in "Name",    with: user.name
  fill_in "Password", with: user.password
  click_button "Sign in"
end