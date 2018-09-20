class UsersController < ApplicationController

    before_action :authenticate_user!


	def index
        @users = User.all
        @user = current_user
        @book = Book.new

	end

	def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = Book.all
	end

	def edit
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to books_path
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
         redirect_to user_path,flash: {notice: 'User info was successfully updated'}
       else
        redirect_to books_path, alert: 'Error!Change a few things up and try submitting again.'
       end

    end

    private
 
    def user_params
        params.require(:user).permit(:name, :Introduction, :profile_image)
    end

end
