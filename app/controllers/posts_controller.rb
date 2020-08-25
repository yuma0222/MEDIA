class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		if signed_in?
           @post  = Post.where(user_id:current_user).build
        if params[:q]
           @posts = Post.search_by_keyword(params[:q])
                        .page(params[:page])
         else
          @posts = Post.order(created_at: :desc).page(params[:page]).per(15)
      end
      end
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

	def bookmarks
    end

	private

	def post_params
	   params.require(:post).permit(:date, :title, :time, :word, :body)
    end
end