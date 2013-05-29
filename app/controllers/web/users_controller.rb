class Web::UsersController < Web::ApplicationController

  # GET /users/new
  def new
    @user = UserSignInType.new
  end

  # POST /users
  def create
    @user = UserRegistrationType.new(params[:user_sign_in_type])

    if @user.save
      sign_in @user
      flash_success
      redirect_to root_path
    else
      flash_error
      render action: 'new'
    end
  end

end
