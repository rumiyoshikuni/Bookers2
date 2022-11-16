class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def index
    @book= Book.new
    @books= Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
        if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    @book.destroy
  end

  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end