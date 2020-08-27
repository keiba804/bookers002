class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@newbook = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	    	redirect_to user_path(@user), notice: 'Book was successfully updated.'
	    else
	    	render 'edit'
	    end
	end
end
