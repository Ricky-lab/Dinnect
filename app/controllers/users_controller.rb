class UsersController < ApplicationController

  before_action :auth_user, only: [:show, :my_events]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # User registration successful, handle as needed (e.g., sign them in).
      flash[:success] = "Sign-up was successful. You can now log in."
      redirect_to login_path, notice: 'Registration successful! Please log in.'
    else
      render 'new'
     end
  end

  def show #login in successfully
    @user = User.find(params[:id])
  end

  # to show all the related events
  def my_events
    # @user_events = current_user.user_events.includes(:event)
    @holder_events = current_user.user_events.where(role: 'holder').includes(:event)
    # @participator_events = current_user.user_events.where(role: 'participator').includes(:event)
    @participator_events = current_user.user_events.where(role: 'participator').includes(event: :user_events).where.not(id: @holder_events.pluck(:id))
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def auth_user
    unless session[:user_id]
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

end
