class Web::SessionsController < Web::ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_to root_url, notice: t('session.logged_in')
    else
      flash.now.alert = t('session.invalid_auth')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: t('session.logged_out')
  end
end
