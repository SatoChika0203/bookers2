class BooksController < ApplicationController
  def index
    @books=Book.all
    @newBook=Book.new
    
    # @users=User.all
    # @profile_images=@users.profile_image
    
    # @user=User.find(params[:id])
  end
  
  def create
   book=Book.new(book_params)
   book.user_id=current_user.id
   if book.save
    redirect_to book_path(book.id)
   else
    @books=Book.all
    @newBook=Book.new
    render :index
   end
  end

  def show
    @book=Book.find(params[:id])
    @newBook=Book.new
    
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(book.id)
    else
       render :edit
    end
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
