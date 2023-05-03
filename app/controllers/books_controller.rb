class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
 # before_actionメソッド：コントローラーで各アクションを実行する前に実行したい処理を指定することができる

  def index
    @books=Book.all
    @newBook=Book.new
  end

  def create
   @newBook=Book.new(book_params)
  @newBook.user_id=current_user.id
   if @newBook.save
    flash[:notice]="You have created book successfully."
    redirect_to book_path(@newBook.id)
   else
    @books=Book.all
    render :index, status: :unprocessable_entity
   end
  end

  def show
    @book=Book.find(params[:id])
    @user=@book.user
    @newBook=Book.new

  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id=current_user.id
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
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

  def is_matching_login_user
    @book=Book.find(params[:id])
    @user=@book.user
    # Bookを、ログインしているUserと関連付ける
    # アソシエーションで関連づけることで、Userのidが取得できる
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end


end
