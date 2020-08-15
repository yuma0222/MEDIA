class PostsController < ApplicationController

	def index
		@posts = Post.page(params[:page]).reverse_order
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
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to home_index_path(@post.id)
	    else
	    	render :edit
	    end
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