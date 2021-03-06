module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = { value:   user.remember_token,
                                           expires: 2.months.from_now.utc }
    self.current_user = user # This is a METHOD, which needs to be defined!!!
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      redirect_to root_path
    end
  end

  # To define the "method", self.current_user = user
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
