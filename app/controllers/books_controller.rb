class BooksController < ApplicationController
	before_action :authenticate_user!, except:[:top, :about]
	before_action :ensure_correct_user,{only:[:edit, :update,:destroy]}
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
		@book = Book.new(book_params)
		@book.user = current_user
	    if @book.save(book_params)
	    	redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
	    else
	    	@user = current_user
			@books = Book.all
	    	render 'index'
	    end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	def update
		@book = Book.find(params[:id])
	    if @book.update(book_params)
	    	redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
	    else
	    	render 'edit'
	    end
	end

	def ensure_correct_user
	  @book = Book.find(params[:id])
	  if @book.user_id != current_user.id
	  redirect_to books_path
	  end
	end

	private
		def book_params
			params.require(:book).permit(:title, :body)
		end

end
