module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

end
