class BooksController < ApplicationController

  before_action :authenticate_user!


  def index
      @book = Book.new
      @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
      @user = @book.user

  end

  def new
  	@book = Book.new
  end
  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
  	 redirect_to book_path(book.id), flash: {notice:'New book was successfully created'}
    else
      redirect_to books_path, alert: 'Error!Change a few things up and try submitting again.'
    end
  end

  def edit
      @book = Book.find(params[:id])
      if @book.user.id != current_user.id
        redirect_to books_path
      end
  end

  def update
      book = Book.find(params[:id])
      if book.update(book_params)
       redirect_to book_path(book.id), flash: {notice: 'Book was successfully updated' }
      else
       redirect_to books_path, alert: 'Error!Change a few things up and try submitting again.'
     end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path(book.id)
  end

  private
 
    def book_params
        params.require(:book).permit(:title, :opinion, :user_id)
    end
end
