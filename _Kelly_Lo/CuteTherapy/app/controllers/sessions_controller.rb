class SessionsController < ApplicationController
	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def new
	end

	def create
	@user = User.find_authenticated_user(params[:username], params[:password])
	if @user.present?
		flash[:notice] = "Welcome back #{@user.username}"
		session[:user_id] = @user.id
		redirect_to videos_path
	else
		flash[:error] = "Invalid username or password."
		redirect_to new_session_path
	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
