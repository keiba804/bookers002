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
		@user = User.find(params[:id])
		@book = Book.find(params[:id])
		@newbook = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
	end

	def destroy
	end

	def update
		@book = Book.find(params[:id])
	    if @book.update(book_params)
	    	redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
	    else
	    	render 'edit'
	    end
	end

	private
		def book_params
			params.require(:book).permit(:title, :body)
		end

end
