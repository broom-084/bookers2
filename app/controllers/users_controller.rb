class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
