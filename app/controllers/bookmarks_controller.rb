class BookmarksController < ApplicationController
	before_action :authenticate_user!

	def index
		@bookmarks = Bookmark.where(user_id: current_user.id).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
	end

	def create
		user = current_user
		post = Post.find(params[:post_id])
		Bookmark.create(user_id: user.id, post_id:post.id)
		#@bookmarks = Bookmark.new
        #@bookmarks.user_id = current_user.id
		#@bookmarks.post_id = post_params.id
		redirect_to request.referer
	end

	def destroy
		user = current_user
		post = Post.find(params[:post_id])
		bookmark = Bookmark.find_by(user_id: user.id, post_id: post.id)
		bookmark.delete
		redirect_to request.referer
	end

end