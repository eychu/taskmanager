module Web::SessionsHelper

  def owner? (user)
    current_user == user
  end

end
