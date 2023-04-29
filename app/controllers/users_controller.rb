class UsersController < ApplicationController
  def index
    @users=User.all
    @books=Book.all
    @book=Book.new
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
      @book=Book.new()
      render :index
    end
  end

  def show
  end

  def edit
  end
  
end
