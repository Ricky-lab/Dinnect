class ProfilesController < ApplicationController
    def new
      @profile = Profile.new
    end
  
    def create
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      @profile = @current_user.build_profile(profile_params)
      if @profile.save
        redirect_to '/users/'+session[:user_id].to_s
      else
        render :new
      end
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
  
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :class_name, :school, :major, :dietary_preference, :email)
    end
  end
