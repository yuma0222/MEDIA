class HomeController < ApplicationController

	def top
	end

	def index
	  @posts = current_user.posts
	end

	def about
	end

end