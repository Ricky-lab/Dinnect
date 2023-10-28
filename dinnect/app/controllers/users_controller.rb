class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # User registration successful, handle as needed (e.g., sign them in).
      redirect_to root_path, notice: 'Registration successful!'
    else
      render 'new'
    end
  end

  def show #login in successfully
    @user = User.find(params[:id])
  end


  private


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
