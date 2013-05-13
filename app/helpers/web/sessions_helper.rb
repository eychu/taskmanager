module Web::SessionsHelper

  def authorized?
    session[:user_id] && User.exists?(session[:user_id])
  end

  def signin (user)
    session[:user_id] = user.id
  end

  def owner? (user)
    current_user == user
  end

end
