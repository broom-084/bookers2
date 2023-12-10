class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
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
end
