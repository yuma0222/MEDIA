class HomeController < ApplicationController

	def top
	end

	def index
	  @posts = Post.page(params[:page]).reverse_order
	end

	def about
	end

end