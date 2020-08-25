class BooksController < ApplicationController
	def top
	end

	def about
	end

	def index
		@books = Book.all
		@user = current_user
		@book = Book.new
	end

	def show
	end

	def edit
	end

	def create
	end

	def destroy
	end

	def update
	end

end
