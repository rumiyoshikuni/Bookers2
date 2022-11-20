class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  


  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    if @user.save
      redirect_to root_path, success: "Welcome! You have signed up successfully."
    else
      render :index
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user succeessfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end