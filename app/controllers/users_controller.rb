class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.where.not(id: current_user.id).page(params[:page]).per(15).order(created_at: :desc)
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to home_index_path(@user.id)
		else
		  render :edit
		end
	end

	def leave
	end

	def destroy
	   @user = User.find(params[:id])
	   @user.destroy
	   flash[:success] = 'ユーザーを削除しました。'
	   redirect_to :root
	end

	private
  def user_params
        params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def screen_user
      unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
      end
    end

end