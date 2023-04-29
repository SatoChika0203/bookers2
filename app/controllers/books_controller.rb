class BooksController < ApplicationController
  def index
    
  end
  
  def create
   @books=Book.new(book_params)
   @books.user_id=current_user.id
   @books.save
   redirect_to book_path
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
