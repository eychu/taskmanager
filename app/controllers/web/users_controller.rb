class Web::UsersController < Web::ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])

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
