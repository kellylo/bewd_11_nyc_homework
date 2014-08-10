class VideosController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :show]
	def index
	end

	def show
	end
end
