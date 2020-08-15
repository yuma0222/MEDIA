class PostsController < ApplicationController

	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to home_index_path
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to home_index_path
	end

	private

	def post_params
	   params.require(:post).permit(:title, :time, :word, :body)
    end
end