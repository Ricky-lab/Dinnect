class ProfilesController < ApplicationController

  before_action -> { authenticate_user(params[:id].to_i) }, only: [:edit, :update, :show, :destory]

  before_action :set_current_user
  before_action :set_profile, only: [:edit, :update, :show]

    def new
      # Build new profile if it doesn't exist, otherwise redirect to edit
      if @current_user.profile
        redirect_to edit_profile_path(@current_user.profile)
      else
        @profile = @current_user.build_profile
      end
    end

    def create
      @profile = @current_user.build_profile(profile_params)
      if @profile.save
        redirect_to user_path(@current_user)
      else
        render :new
      end
    end
    def edit
      # @profile is set by the set_profile before_action
      @profile
    end

    def update
      if @profile.update(profile_params)
        redirect_to user_path(@current_user), notice: 'Profile updated successfully'
      else
        render :edit
      end
    end

    def show
      # @profile is set by the set_profile before_action
    end

    private

    def set_current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_profile
      @profile = @current_user.profile
    end

    # def show
    #     if @profile
    #         # The profile was found, render the show page
    #     else
    #         # The profile was not found, redirect or handle as needed
    #         redirect_to users_path(@current_user)
    #     end
    #   end
    private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :class_name, :school, :major, :dietary_preference, :email)
    end
  end
