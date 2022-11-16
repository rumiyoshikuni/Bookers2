class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]) 
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def index
    # @user =　User.find(params[:id])
    @book= Book.new
    @books= Book.all
  end
  
  private
  def book_params
    params.require(:book).permit(:name, :introduction, :image)  
  end
end
