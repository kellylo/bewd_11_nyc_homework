class UserController < ApplicationController
before_filter :save_login_state, :only => [:new, :create]
	def new
		@user= User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "You signed up sucessfully"
		flash[:color]= "valid"	
		else
		flash[:notice] = "Form is invalid"
		flash[:color]= "Invalid"
		end		
	render 'new'
	end
end
