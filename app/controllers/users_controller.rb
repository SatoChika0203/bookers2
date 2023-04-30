class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  # editとupdateを呼び出す前に実行されるアクション
  
  def index
    @users=User.all
    # @user=User.find(params[:id])
    @books=Book.all
    @newBook=Book.new
    # @profile_images=@users.profile_image
    
    # @user=User.find(params[:id])
    # @profile_image=@user.profile_image
    
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
    @user=User.find(params[:id])
    @book=@user.books
    # 特定のユーザー（@user）に関連付けられたbookすべて（.books）を取得する
    @newBook=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(user.id)
    else
     render :edit
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def is_matching_login_user
    @user=User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
