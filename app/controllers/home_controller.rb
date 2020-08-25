class HomeController < ApplicationController

	def top
	end

	def index
	  @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(14)
	  #@posts = Post.where(user_id:current_user).page(params[:page]).per(20)
	end

	def about
	end

end