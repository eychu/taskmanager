class Web::SessionsController < Web::ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      flash_success
      redirect_to root_url
    else
      flash_error
      render 'new'
    end
  end

  def destroy
    sign_out
    flash_success
    redirect_to root_url
  end
end
