class UsersController < ApplicationController
  
  def show
    @user =　User.find(params[:id])
    @books = @user.books
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def index
    @book =　Book.find(params[:id])
    @book= Book.new
    @books= Book.all
  end
  
  private
  def list_params
    params.require(:book).permit(:name, :introduction, :image)  
  end
  
end
