class Web::UsersController < Web::ApplicationController

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        signin @user
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

end
